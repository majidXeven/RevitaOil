//
//  ProductsView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import SwiftUI
import PopupView

struct Product: Identifiable {
    var id = UUID()
    var name : String
    var category : String
    var price: Int
    var icon: String
    var quantity: Int = 2
}

struct ProductsView: View {
    
    @State var searchText = ""
    @State var showFilterPopup: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    let products = [
        Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 45, icon: "product1"),
        Product(name: "Sweet Dreams", category: "Chicken Flavor", price: 50, icon: "product2"),
        Product(name: "Salt Chews", category: "Chicken Flavor", price: 55, icon: "product3"),
        Product(name: "Pet Tincture", category: "Chicken Flavor", price: 60, icon: "product4"),
        Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 45, icon: "product1"),
        Product(name: "Sweet Dreams", category: "Chicken Flavor", price: 50, icon: "product2"),
        Product(name: "Salt Chews", category: "Chicken Flavor", price: 55, icon: "product3"),
        Product(name: "Pet Tincture", category: "Chicken Flavor", price: 60, icon: "product4")
    ]
    
    var body: some View {
//        NavigationView {
            VStack {
                SearchBarView(onClickSearchButton: .constant({
                    
                }),onClickFilterButton: .constant({
                    self.showFilterPopup.toggle()
                }), onClicCartButton: .constant({
                    
                }), onClickProfileButton: .constant({
                    
                }), searchText: $searchText, placeholderText: .constant("Search Product"), isShowCartButton: false, isShowProfileButton: false)
                .padding(.top, 20)
                
                Divider()
                    .padding(.top, 10)
                    .foregroundColor(Color(hex: "#544848"))
                
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<products.count, id: \.self) { index in
                            NavigationLink(
                                destination: ProductDetailView(),
                                label: {
                                    ProductView(onClickAddToCartButton: .constant({
                                        
                                    }), product: products[index])
                                    .padding(.top, 10)
                                }
                            )
                        }
                    }
                    
                }
                
//                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                
                
                
//                List(products) { product in
//                    NavigationLink(
//                        destination: ProductDetailView(),
//                        label: {
//                            ProductView(onClickAddToCartButton: .constant({
//                                
//                            }), product: product)
//                            .buttonStyle(PlainButtonStyle())
//                            .listRowSeparator(.hidden)
//                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
//                            .onTapGesture(perform: {
//                                print("sasas")
//                            })
//                        }
//                    )
//                    
//                }
//                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
//                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
//                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.black)
            })
                                , trailing: Image(systemName: "")
                .font(.system(size: 20))
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("PRODUCTS")
                          .font(.customFont(font: .sfPro, style: .medium, size: 20))
                          .foregroundColor(.black)
                    }
                }
            }
            .popup(isPresented: $showFilterPopup) {
                ZStack {
                    CategoryFilterPopupView(onClickCancelButton: .constant({
                        self.showFilterPopup = false
                    }))
                }
                
            } customize: {
                $0
                //                .type(.floater())
                //                .position(.top)
                    .closeOnTap(false)
                    .animation(.default)
                    .closeOnTapOutside(true)
                    .backgroundColor(.black.opacity(0.5))
            }
//        }
    }
}

#Preview {
    ProductsView()
}
