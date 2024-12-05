//
//  ChangedPasswordView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct ChangedPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [String]
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Image("successmark")
                .frame(width: 100, height: 100)
                .padding(.bottom, 30)
            
            
            Text("Password Changed!")
                .multilineTextAlignment(.center)
                .font(.customFont(font: .sfPro, style: .bold, size: 26))
            
            Text("Your password has been changed\nsuccessfully.")
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: "#8391A1"))
                .font(.customFont(font: .sfPro, style: .medium, size: 15))
                .padding(.bottom, 10)
            
                
            Button(action: {
//                dismiss()
                path = []
            }, label: {
                HStack {
                    Spacer()
                    Text("BACK TO LOGIN")
                        .foregroundColor(.white)
                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                    Spacer()
                }
            })
            
            .frame(width: screenWidth - 40, height: 50)
            .background(Color("buttonColor"))
            .cornerRadius(2)
            .padding(.top, 30)
            
        }
        .padding(20)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChangedPasswordView(path: .constant([]))
}
