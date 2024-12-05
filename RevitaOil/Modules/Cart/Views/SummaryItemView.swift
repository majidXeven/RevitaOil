//
//  SummaryItemView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct SummaryItemView: View {
    
    @State var product: Product
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack {
                    Image(product.icon)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                }
                
                .frame(width: 66, height: 58)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
                .cornerRadius(2)
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(product.name)
                            .foregroundColor(Color.init(hex: "#221F1F"))
                            .font(.customFont(font: .sfPro, style: .medium, size: 16))
                            .lineLimit(1)
                        
                        Text(product.category)
                            .foregroundColor(Color.init(hex: "#7D7B7B"))
                            .font(.customFont(font: .sfPro, style: .regular, size: 14))
                            .lineLimit(1)
                        
                        Text("Quantity: \(product.quantity)")
                            .foregroundColor(Color.init(hex: "#7D7B7B"))
                            .font(.customFont(font: .sfPro, style: .regular, size: 14))
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Spacer()
                        Text("$ \(product.price)")
                            .foregroundColor(.button)
                            .font(.customFont(font: .sfPro, style: .medium, size: 20))
                            .lineLimit(1)
                        Spacer()
                    }
                    
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
            }
        }
    }
}

#Preview {
    SummaryItemView(product: Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 12, icon: "product4"))
}
