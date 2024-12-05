//
//  PopularProductView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 26/04/2024.
//

import SwiftUI

struct PopularProductView: View {
    
    @State var product: Product
    @State var isShowProductView: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image(product.icon)
                    .resizable()
                    .padding()
                
                Divider()
                    .foregroundColor(Color(hex: "#544848"))
                    
            }
//            .background(.red)
            .frame(width: (screenWidth - 60) / 2, height: (screenWidth - 100) / 2)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.customFont(font: .sfPro, style: .medium, size: 15))
                    .foregroundColor(Color(hex: "#221F1F"))
                    .lineLimit(1)
//                    .frame(width: (screenWidth - 80) / 2)
                
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text(product.category)
                            .font(.customFont(font: .sfPro, style: .regular, size: 14))
                            .foregroundColor(Color(hex: "#7D7B7B"))
                            .lineLimit(1)
                        //                    .frame(width: (screenWidth - 80) / 2)
                        
                        Text("3 in stock")
                            .font(.customFont(font: .sfPro, style: .medium, size: 10))
                            .foregroundColor(Color.app)
                            .lineLimit(1)
                        //                    .frame(width: (screenWidth - 80) / 2)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isShowProductView.toggle()
                    }) {
                        Image("shopping-cart")
                            .resizable()
                            .frame(width: 11.43 ,height: 11.43)
                    }
                    .frame(width: 29 ,height: 27.69)
                    .background(Color.app)
                    .cornerRadius(2)
                }
            }
            .padding(8)
            .background(Color.white)
        }
        .background(Color(hex: "#EFEFEF"))
        .cornerRadius(2)
        .shadow(color: .black.opacity(0.12), radius: 2, x: 1, y: 1)
        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: -1)
//        .shadow(color: .black.opacity(0.20), radius: 5, x: 0, y: 4)
        .frame(width: (screenWidth - 60) / 2)
        
        
    }
}

#Preview {
    PopularProductView(product: Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavour", price: 50, icon: "product1"))
}
