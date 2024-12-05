//
//  CustomGiftCardAmountView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 30/04/2024.
//

import SwiftUI

struct CustomGiftCardAmountView: View {
    
    @Binding var onClickCancelButton: (() -> Void)?
    @Binding var onClickApplyFilterButton: (() -> Void)?
    @Binding var value: String
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                
                HStack {
                    Text("Custom")
                        .font(.customFont(font: .sfPro, style: .bold, size: 22))
                        .foregroundColor(Color(hex: "#707070"))
                    
                    Spacer()
                    
                    Button(action: {
                        onClickCancelButton?()
                    }) {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 15 ,height: 15)
                            .tint(.black)
                    }
                    .frame(width: 40 ,height: 40)
                    .cornerRadius(2)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter Amount")
                        .font(.customFont(font: .sfPro, style: .medium, size: 14))
                        .foregroundColor(Color(hex: "#2A2A2A"))
                    
                    HStack {
                        TextField(
                            "Enter Amount",
                            text: $value
                        )
                        .keyboardType(.numberPad)
                        .font(.customFont(font: .sfPro, style: .regular, size: 14))
                        .padding()
                    }
                    .frame(height: 44)
                    .cornerRadius(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color(hex: "#CCCCCC"), lineWidth: 1)
                    )
                }
                
                Button(action: {
                    onClickApplyFilterButton?()
                }, label: {
                    Text("SELECT")
                        .foregroundColor(.white)
                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                })
                
                .frame(width: (screenWidth - 40) / 2, height: 50)
                .background(Color("buttonColor"))
                .cornerRadius(2)
                
            }
            .padding(20)
        }
        .background(.white)
        .cornerRadius(2)
        .padding(20)
    }
}

#Preview {
    CustomGiftCardAmountView(onClickCancelButton: .constant(nil), onClickApplyFilterButton: .constant(nil), value: .constant(""))
}
