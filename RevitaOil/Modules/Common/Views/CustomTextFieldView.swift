//
//  FormTextFieldView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    @State var title: String
    @State var placeholder: String
    @State var showLeadingButton = false
    @State var showTrailingButton = false
    @State var leadingButtonImage = "userFilled"
    @State var trailingButtonImage = "arrowDown"
    @State var isDropdwon = false
    @Binding var text: String
    @State var onClickDropDown: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.customFont(font: .sfPro, style: .medium, size: 14))
                .foregroundColor(Color(hex: "#2A2A2A"))
            if isDropdwon {
                Button {
                    onClickDropDown?()
                } label: {
                    HStack(spacing: 0) {
                        if showLeadingButton {
                            Button(action: {
                                
                            }, label: {
                                Image(leadingButtonImage)
                                    .tint(Color(hex: "#6A707C"))
                                    .aspectRatio(contentMode: .fit)
                            })
                            .frame(width: 20, height: 20)
                            .padding(.leading, 12)
                        }
                        
                        TextField(
                            placeholder,
                            text: $text
                        )
                        .frame(height: 44)
                        .multilineTextAlignment(.leading)
                        .disabled(true)
                        .font(.customFont(font: .sfPro, style: .regular, size: 14))
                        .padding([.leading, .trailing], 12)
                        
                        if showTrailingButton {
                            Button(action: {
                                
                            }, label: {
                                Image(trailingButtonImage)
                                    .tint(Color(hex: "#6A707C"))
                                    .aspectRatio(contentMode: .fit)
                            })
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 12)
                        }
                        
                    }
                }
                .frame(height: 44)
                .cornerRadius(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color(hex: "#CCCCCC"), lineWidth: 1)
                )
            }else {
                HStack(spacing: 0) {
                    if showLeadingButton {
                        Button(action: {
                            
                        }, label: {
                            Image(leadingButtonImage)
                                .tint(Color(hex: "#6A707C"))
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(width: 20, height: 20)
                        .padding(.leading, 12)
                    }
                    
                    TextField(
                        placeholder,
                        text: $text
                    )
                    .frame(height: 44)
                    .font(.customFont(font: .sfPro, style: .regular, size: 14))
                    .padding([.leading, .trailing], 12)
                    
                    if showTrailingButton {
                        Button(action: {
                            
                        }, label: {
                            Image(trailingButtonImage)
                                .tint(Color(hex: "#6A707C"))
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 12)
                    }
                    
                }
                .frame(height: 44)
                .cornerRadius(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color(hex: "#CCCCCC"), lineWidth: 1)
                )
            }
        }
    }
}

#Preview {
    CustomTextFieldView(title: "Full Name", placeholder: "Full Name", text: .constant(""))
}
