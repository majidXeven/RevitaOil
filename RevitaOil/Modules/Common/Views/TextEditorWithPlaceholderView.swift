//
//  TextEditorWithPlaceholderView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct TextEditorWithPlaceholderView: View {
    
    @State var title: String
    @State var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.customFont(font: .sfPro, style: .medium, size: 14))
                .foregroundColor(Color(hex: "#2A2A2A"))
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    VStack {
                        Text(placeholder)
                            .font(.customFont(font: .sfPro, style: .regular, size: 14))
                            .padding(.top, 10)
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
                
                VStack {
                    TextEditor(text: $text)
                        .font(.customFont(font: .sfPro, style: .regular, size: 14))
                        .padding(.top, 3)
                        .padding(.leading, 12)
                        .frame(minHeight: 80, maxHeight: 300)
                        .opacity(text.isEmpty ? 0.85 : 1)
                    Spacer()
                }
            }
            .cornerRadius(2)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(hex: "#CCCCCC"), lineWidth: 1)
            )
        }
    }
}

#Preview {
    TextEditorWithPlaceholderView(title: "Message", placeholder: "Write Message...", text: .constant(""))
}
