//
//  HomeView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 26/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var tabbarViewModel: TabbarViewModel
    @State var searchText = ""
    @State private var isShowLoginView = false
    
    let imageNames = ["bannerImage1", "bannerImage2", "bannerImage3", "bannerImage1", "bannerImage2", "bannerImage3"]
    
    let categories = [Category(title: "Smokeable", image: "product1"),
                      Category(title: "Oil Tinctures", image: "product2"),
                      Category(title: "Topicals", image: "product3"),
                      Category(title: "Vapes", image: "product4"),
                      Category(title: "Day Dreams", image: "product1"),
                      Category(title: "Balance", image: "product2")]
    
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
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path, root: {
            VStack(spacing: 20) {
                SearchBarView(onClickSearchButton: .constant({
                    
                }),onClickFilterButton: .constant({
                    
                }), onClicCartButton: .constant({
                    self.tabbarViewModel.changeTab(index: 1)
                }), onClickProfileButton: .constant({
                    //                self.isShowLoginView = true
//                    path.append(1)
//                    path.append("Login")
                }), searchText: $searchText, placeholderText: .constant("Search Product"), isShowFilterButton: false)
                
                ScrollView {
                    
                    AutoScrollerView(imageNames: imageNames)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(0..<categories.count, id: \.self) { index in
                                NavigationLink(
                                    destination: ProductsView(),
                                    label: {
                                        CategoryView(category: categories[index])
                                    }
                                )
                            }
                        }
                        .padding([.top, .leading, .trailing], 5)
                    }
                    .scrollIndicators(.hidden)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text("Popular Products")
                                .font(.customFont(font: .sfPro, style: .bold, size: 24))
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        
                        ScrollView(.vertical) {
                            LazyVGrid(columns: adaptiveColumn, spacing: 15) {
                                ForEach(0..<products.count, id: \.self) { index in
                                    NavigationLink(
                                        destination: ProductsView(),
                                        label: {
                                            PopularProductView(product: products[index])
                                        }
                                    )
                                }
                            }
                            .padding(.bottom, 10)
                            .padding(.top, 5)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    }
                    
                }
                
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "Login":
                    LoginView(path: $path)
                case "ForgotPassword":
                    ForgotPasswordView(path: $path)
                case "OTPVerification":
                    OTPVerificationView(path: $path)
                case "CreateNewPassword":
                    CreateNewPasswordView(path: $path)
                case "ChangedPassword":
                    ChangedPasswordView(path: $path)
                default:
                    HomeView(tabbarViewModel: tabbarViewModel)
                }
            }
        })
        .background(.clear)
    }
}

#Preview {
    HomeView(tabbarViewModel: TabbarViewModel())
}
