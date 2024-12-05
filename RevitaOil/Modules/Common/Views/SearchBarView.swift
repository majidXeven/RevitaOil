//
//  SearchBarView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 26/04/2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var onClickSearchButton: (() -> Void)?
    @Binding var onClickFilterButton: (() -> Void)?
    @Binding var onClicCartButton: (() -> Void)?
    @Binding var onClickProfileButton: (() -> Void)?
    @Binding var searchText: String
    @Binding var placeholderText: String
    
    @State var isShowFilterButton: Bool = true
    @State var isShowCartButton: Bool = true
    @State var isShowProfileButton: Bool = true
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                TextField(
                    placeholderText,
                    text: $searchText
                )
                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                .padding()
                
                Button(action: {
                    onClickSearchButton?()
                }) {
                    Image("magnifyingglass")
                        .resizable()
                        .frame(width: 11.26 ,height: 11.43)
                }
                .frame(width: 30 ,height: 30)
                .background(Color.init(hex: "#E3E3E3"))
                .cornerRadius(2)
                .padding(.trailing, 7)
                
                if self.$isShowFilterButton.wrappedValue {
                    Button(action: {
                        onClickFilterButton?()
                    }) {
                        Image("filtter_ic")
                            .resizable()
                            .frame(width: 16 ,height: 15)
                    }
                    .frame(width: 30 ,height: 30)
                    .background(Color.init(hex: "#E3E3E3"))
                    .cornerRadius(2)
                    .padding(.trailing, 7)
                    .padding(.leading, -7)
                }
            }
            .frame(height: 44)
            .background(Color.whiteSmoke)
            .cornerRadius(2)
            
            
            if self.$isShowCartButton.wrappedValue {
                Button(action: {
                    onClicCartButton?()
                }) {
                    Image("shopping-cart")
                        .resizable()
                        .frame(width: 11.43 ,height: 11.43)
                }
                .frame(width: 30 ,height: 30)
                .background(Color.app)
                .cornerRadius(2)
            }
            
            if self.$isShowProfileButton.wrappedValue {
                Button(action: {
                    onClickProfileButton?()
                }) {
                    Image("userProfile")
                        .resizable()
                }
                .frame(width: 30 ,height: 30)
                .background(Color.app)
                .cornerRadius(2)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

#Preview {
    SearchBarView(onClickSearchButton: .constant(nil) ,onClickFilterButton: .constant(nil), onClicCartButton: .constant(nil), onClickProfileButton: .constant(nil), searchText: .constant(""), placeholderText: .constant(""))
}
