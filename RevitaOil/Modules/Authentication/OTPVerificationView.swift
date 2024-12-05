//
//  OTPVerificationView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct OTPVerificationView: View {
    
    @State private var email = ""
    
//    @State private var isShowCreateNewPasswordView = false
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("OTP Verification")
                .font(.customFont(font: .sfPro, style: .bold, size: 30))
            
            Text("Enter the verification code we just sent on your email address.")
                .foregroundColor(Color(hex: "#8391A1"))
                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                .padding(.bottom, 20)
            
//            HStack {
//                TextField(
//                    "Enter your email",
//                    text: $email
//                )
//                .keyboardType(.emailAddress)
//                .font(.customFont(font: .sfPro, style: .regular, size: 14))
//                .padding()
//            }
//            .background(Color(hex: "#F7F8F9"))
//            .frame(height: 44)
//            .cornerRadius(2)
//            .overlay(
//                RoundedRectangle(cornerRadius: 2)
//                    .stroke(Color(hex: "#E8ECF4"), lineWidth: 1)
//            )
            
            OtpView(activeIndicatorColor: Color(hex: "#E8ECF4"), inactiveIndicatorColor: Color(hex: "#35C2C1"),  length: 4, doSomething: { value in
                            // Do something with the value input
            })
            .padding()
                
            Button(action: {
//                self.isShowCreateNewPasswordView = true
                path.append("CreateNewPassword")
            }, label: {
                HStack {
                    Spacer()
                    Text("VERIFY")
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
            
            Button(action: {

            }, label: {
                Group {
                    Text("Didn’t received code?")
                        .foregroundColor(.black)
                        .font(.customFont(font: .sfPro, style: .medium, size: 15)) +

                    Text(" Resend")
                        .foregroundColor(.app)
                        .font(.customFont(font: .sfPro, style: .bold, size: 15))
                }
            })
            .frame(width: screenWidth - 40, height: 20)
        }
        .padding(20)
        .navigationDestination(for: String.self) { value in
            CreateNewPasswordView(path: $path)
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
    OTPVerificationView(path: .constant([]))
}
