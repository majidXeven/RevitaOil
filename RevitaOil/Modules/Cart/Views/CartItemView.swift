//
//  CartItemView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct CartItemView: View {
    @State var product: Product
    
    @Binding var onClickDeleteButton: (() -> Void)?
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack {
                    Image(product.icon)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                }
                
                .frame(width: 80, height: 80)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
                .cornerRadius(2)
                .padding(.leading, 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.name)
                                .foregroundColor(Color.init(hex: "#221F1F"))
                                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                                .lineLimit(1)
                            
                            Text(product.category)
                                .foregroundColor(Color.init(hex: "#7D7B7B"))
                                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            onClickDeleteButton?()
                        }) {
                            Image("trash")
                                .resizable()
                                .frame(width: 24 ,height: 24)
                        }
                        .frame(width: 30 ,height: 30)
                    }
                    
                    
                    HStack {
                        Text("$ \(product.price)")
                            .font(.customFont(font: .sfPro, style: .medium, size: 24))
                            .foregroundColor(Color.init(hex: "#007537"))
                        
                        Spacer()
                        
                        Button(action: {
                            // action to perform when the button is tapped
                        }) {
                            Image(systemName: "minus.square")
                                .resizable()
                        }
                        .frame(width: 20 ,height: 20)
                        .tint(.black)
                        
                        Text("1")
                            .padding([.leading, .trailing], 10)
                        
                        Button(action: {
                            // action to perform when the button is tapped
                        }) {
                            Image(systemName: "plus.app")
                                .resizable()
                        }
                        .frame(width: 20 ,height: 20)
                        .tint(.black)
                    }
                    
                }
                .overlay(alignment: .top, content: {
                    
                })
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 20))
            }
            
            Divider()
                .padding(.top, 10)
                .foregroundColor(Color(hex: "#544848"))
        }
    }
}

#Preview {
    CartItemView(product: Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 12, icon: "product4"), onClickDeleteButton: .constant(nil))
}
