//
//  CategoryCell.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 26/04/2024.
//

import SwiftUI

struct Category : Identifiable {
    var id = UUID()
    var title : String
    var image : String
}

struct CategoryView: View {
    
    @State var category: Category
    
    var body: some View {
        VStack {
            HStack {
                Image(category.image)
                    .resizable()
                    .padding()
                
            }
            .background(Color(hex: "#F0FDE4"))
//            .clipShape(.circle)
            .cornerRadius(2)
            .frame(width: (screenWidth - 80) / 3, height: (screenWidth - 80) / 3)
            
            Text(category.title)
                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                .foregroundColor(Color(hex: "#221F1F"))
                .lineLimit(1)
                .frame(width: (screenWidth - 80) / 3)
        }
        .padding(0)
        .shadow(color: .black.opacity(0.12), radius: 2, x: 1, y: 1)
        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: -1)
    }
}

#Preview {
    CategoryView(category: Category(title: "Smokeable", image: "product1"))
}
