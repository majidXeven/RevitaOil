//
//  ProductView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import SwiftUI

struct ProductView: View {
    
    @Binding var onClickAddToCartButton: (() -> Void)?
    @State var product: Product
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack {
                    Image(product.icon)
                        .resizable()
                        .scaledToFit()
                }
                
                .frame(width: 80, height: 95)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
                .cornerRadius(2)
                .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .foregroundColor(Color.init(hex: "#221F1F"))
                        .font(.customFont(font: .sfPro, style: .medium, size: 20))
                    
                    Text(product.category)
                        .foregroundColor(Color.init(hex: "#7D7B7B"))
                        .font(.customFont(font: .sfPro, style: .regular, size: 14))
                    
                    HStack {
                        Text("$ \(product.price)")
                            .font(.customFont(font: .sfPro, style: .medium, size: 26))
                            .foregroundColor(Color.init(hex: "#007537"))
                        
                        Spacer()
                        
                        Button(action: {
                            onClickAddToCartButton?()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("ADD TO CART")
                                    .foregroundColor(.white)
                                    .font(.customFont(font: .sfPro, style: .medium, size: 10))
                                Spacer()
                            }
                        })
                        .frame(width: 91, height: 38)
                        .background(Color("buttonColor"))
                        .cornerRadius(2)
                        
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
    ProductView(onClickAddToCartButton: .constant(nil), product: Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 12, icon: "product1"))
}
