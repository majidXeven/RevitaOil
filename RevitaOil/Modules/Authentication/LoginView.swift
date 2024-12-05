//
//  LoginView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isSecurePassword = true
    
//    @State private var isShowForgotPasswordView = false
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 15) {
            
            Image("logo")
//                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
            
            Text("Welcome back! Glad to see you, Again!")
                .font(.customFont(font: .sfPro, style: .bold, size: 30))
                .padding(.bottom, 30)
            
            HStack {
                TextField(
                    "Enter your email",
                    text: $email
                )
                .keyboardType(.emailAddress)
                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                .padding()
            }
            .background(Color(hex: "#F7F8F9"))
            .frame(height: 44)
            .cornerRadius(2)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(hex: "#E8ECF4"), lineWidth: 1)
            )
            
            HStack {
                Group{
                    if isSecurePassword {
                        SecureField(
                            "Enter your password",
                            text: $password
                        )
                    }else {
                        TextField(
                            "Enter your password",
                            text: $password
                        )
                    }
                }
                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                .padding()
                
                Button(action: {
                    self.isSecurePassword.toggle()
                }, label: {
                    Image(systemName: !isSecurePassword ? "eye" : "eye.slash")
                        .tint(Color(hex: "#6A707C"))
                })
                .padding()
                .frame(height: 20)
            }
            .background(Color(hex: "#F7F8F9"))
            .frame(height: 44)
            .cornerRadius(2)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(hex: "#E8ECF4"), lineWidth: 1)
            )
            
            HStack() {
                Spacer()
                Button(action: {
//                    self.isShowForgotPasswordView = true
                    path.append("ForgotPassword")
                }, label: {
                    Text("Forgot Password?")
                        .foregroundColor(Color(hex: "#6A707C"))
                        .font(.customFont(font: .sfPro, style: .bold, size: 14))
                })
                .frame(height: 20)
            }
            
            Button(action: {
                path = []
            }, label: {
                HStack {
                    Spacer()
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                    Spacer()
                }
            })
            
            .frame(width: screenWidth - 40, height: 50)
            .background(Color("buttonColor"))
            .cornerRadius(2)
            .padding(.top, 30)
            
            Spacer()
            
//            Button(action: {
//                
//            }, label: {
//                Group {
//                    Text("Don’t have an account?")
//                        .foregroundColor(.black)
//                        .font(.customFont(font: .sfPro, style: .medium, size: 15)) +
//                    
//                    Text(" Register Now")
//                        .foregroundColor(.app)
//                        .font(.customFont(font: .sfPro, style: .bold, size: 15))
//                }
//            })
//            .frame(width: screenWidth - 40, height: 20)
        }
        .padding(20)
        .navigationDestination(for: String.self) { value in
            ForgotPasswordView(path: $path)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .frame(width: 41, height: 41)
                .foregroundColor(Color.black)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color(hex: "#E8ECF4"), lineWidth: 1)
                )
        })
                            , trailing: Image(systemName: "")
            .font(.system(size: 20))
        )
    }
}

#Preview {
    LoginView(path: .constant([]))
}
