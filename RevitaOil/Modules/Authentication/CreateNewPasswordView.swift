//
//  CreateNewPasswordView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct CreateNewPasswordView: View {
    
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSecurePassword = true
    @State private var isSecureConfirmPassword = true
    
    @State private var isShowChangedPasswordView = false
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("Create new password")
                .font(.customFont(font: .sfPro, style: .bold, size: 30))
            
            Text("Your new password must be unique from those previously used.")
                .foregroundColor(Color(hex: "#8391A1"))
                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                .padding(.bottom, 20)
            
            HStack {
                Group{
                    if isSecurePassword {
                        SecureField(
                            "New Password",
                            text: $password
                        )
                    }else {
                        TextField(
                            "New Password",
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
            
            HStack {
                Group{
                    if isSecureConfirmPassword {
                        SecureField(
                            "Confirm Password",
                            text: $confirmPassword
                        )
                    }else {
                        TextField(
                            "Confirm Password",
                            text: $confirmPassword
                        )
                    }
                }
                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                .padding()
                
                Button(action: {
                    self.isSecureConfirmPassword.toggle()
                }, label: {
                    Image(systemName: !isSecureConfirmPassword ? "eye" : "eye.slash")
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
                
            Button(action: {
//                self.isShowChangedPasswordView = true
                path.append("ChangedPassword")
            }, label: {
                HStack {
                    Spacer()
                    Text("RESET PASSWORD")
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
            
        }
        .padding(20)
        .navigationDestination(for: String.self) { value in
            ChangedPasswordView(path: $path)
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
    CreateNewPasswordView(path: .constant([]))
}
