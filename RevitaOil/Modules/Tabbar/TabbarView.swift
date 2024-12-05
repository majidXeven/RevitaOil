//
//  TabbarView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import Foundation
import SwiftUI

struct TabbarView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel = TabbarViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $viewModel.selectedIndex) {
                    HomeView(tabbarViewModel: viewModel)
                        .tabItem {
                            //                        if viewModel.selectedIndex == 0 {
                            //                            Label("", image: "selectedHome")
                            //                        }else {
                            Label("Home", image: "unselectedHome")
                            //                        }
                        }.tag(0)
                    
                    CartView()
                        .tabItem {
                            //                        if viewModel.selectedIndex == 1 {
                            //                            Label("", image: "selectedCart")
                            //                        }else {
                            Label("Cart", image: "unselectedCart")
                            //                        }
                        }.tag(1)
                    
                    GiftCardView()
                        .tabItem {
                            //                        if viewModel.selectedIndex == 2 {
                            //                            Label("", image: "selectedGiftCart")
                            //                        }else {
                            Label("Gift Card", image: "unselectedGiftCart")
                            //                        }
                        }.tag(2)
                    
                    ContactUSView()
                        .tabItem {
                            //                        if viewModel.selectedIndex == 3 {
                            //                            Label("", image: "selectedContactUs")
                            //                        }else {
                            Label("Contact US", image: "unselectedContactUs")
                            //                        }
                        }.tag(3)
                    
                    //            Group {
                    //                Rectangle().fill(.red)
                    //                    .tabItem {
                    //                        Text("a")
                    //                    }
                    //                Rectangle().fill(.green)
                    //                    .tabItem {
                    //                        Text("b")
                    //                    }
                    //            }
                    //            .toolbarBackground(.blue, for: .tabBar)
                    //            .toolbarBackground(.visible, for: .tabBar)
                }
                .navigationBarHidden(viewModel.selectedIndex == 0 ? true : false)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text(viewModel.selectedIndex == 0 ? "HOME" : viewModel.selectedIndex == 1 ? "YOUR CART" : viewModel.selectedIndex == 2 ? "GIFT CARD" : "CONTACT US")
                                .font(.customFont(font: .sfPro, style: .medium, size: 20))
                                .foregroundColor(.black)
                        }
                        .frame(height: viewModel.selectedIndex == 0 ? 0 : 44)
                    }
                }
                .accentColor(Color("selectedTabColor"))
                .onAppear() {
                    UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: UIColor(Color("tabbarBakgroundColor")))
                    UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: .black.withAlphaComponent(0.3))
                    UITabBar.appearance().backgroundColor = UIColor(Color("tabbarBakgroundColor"))
                    UITabBar.appearance().isTranslucent = false
                    UITabBar.appearance().unselectedItemTintColor = UIColor(Color(hex: "#484C52"))
                    UITabBar.appearance().barTintColor = UIColor(Color("tabbarBakgroundColor"))
                }
            }
        }
    }
}

#Preview {
    TabbarView()
}
