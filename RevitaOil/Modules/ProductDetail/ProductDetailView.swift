//
//  ProductDetailView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State private var isShowCartView = false
    @Environment(\.dismiss) private var dismiss
    
    let imageNames = ["product1", "product2", "product3", "product4"]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {

                    AutoScrollProductImagesView(imageNames: imageNames)
                        .padding(.bottom, 10)
                    
                    Text("Pet Line-300 MG Tinc\n400 MG DL")
                        .padding([.leading, .trailing], 20)
                        .font(.customFont(font: .sfPro, style: .bold, size: 22))
                        .foregroundColor(Color(hex: "#221F1F"))
                    
                    Text("Many of us think of our furry friends as members of the family. As such, RevitaOil developed a product to take care of our four-legged companions. Flavored with chicken, this tincture comes from a full-spectrum phytocannabinoid-rich hemp extract.")
                        .lineSpacing(5)
                        .padding([.leading, .trailing], 20)
                        .font(.customFont(font: .sfPro, style: .regular, size: 14))
                        .foregroundColor(Color(hex: "#666666"))
                    
                    VStack {
                        HStack {
                            Text("SKU:")
                                .font(.customFont(font: .sfPro, style: .medium, size: 13))
                                .foregroundColor(Color(hex: "#263D0C"))
                            
                            Text("00860000535359")
                                .font(.customFont(font: .sfPro, style: .regular, size: 13))
                                .foregroundColor(Color(hex: "#757971"))
                            
                            Spacer()
                            
                            Text("Category:")
                                .font(.customFont(font: .sfPro, style: .medium, size: 13))
                                .foregroundColor(Color(hex: "#263D0C"))
                            
                            Text("Pet")
                                .font(.customFont(font: .sfPro, style: .regular, size: 13))
                                .foregroundColor(Color(hex: "#221F1F"))
                        }
                        
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(height: 1)
                        
                        HStack {
                            Text("$ 45")
                                .font(.customFont(font: .sfPro, style: .bold, size: 32))
                                .foregroundColor(Color(hex: "#007537"))
                            
                            Spacer()
                            
                            Text("279 in stock")
                                .font(.customFont(font: .sfPro, style: .medium, size: 14))
                                .foregroundColor(Color(hex: "#5F981F"))
                            
                        }
                        
                        HStack {
                            
                            
                            Button(action: {
                                // action to perform when the button is tapped
                            }) {
                                Image(systemName: "minus.square")
                                    .resizable()
                            }
                            .frame(width: 30 ,height: 30)
                            .tint(.black)
                            
                            Text("1")
                                .font(.customFont(font: .sfPro, style: .regular, size: 16))
                                .padding([.leading, .trailing], 10)
                            
                            Button(action: {
                                // action to perform when the button is tapped
                            }) {
                                Image(systemName: "plus.app")
                                    .resizable()
                            }
                            .frame(width: 30 ,height: 30)
                            .tint(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Spacer()
                                    Text("ADD TO CART")
                                        .foregroundColor(.white)
                                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                                    Spacer()
                                }
                            })
                            .frame(width: (screenWidth - 40) / 2, height: 50)
                            .background(Color("buttonColor"))
                            .cornerRadius(2)
                            
                        }
                        .padding(.top, 10)
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Spacer()
                                Text("COUNTINUE SHOPPING")
                                    .foregroundColor(.white)
                                    .font(.customFont(font: .sfPro, style: .medium, size: 16))
                                Spacer()
                            }
                        })
                        .frame(width: screenWidth - 40, height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(2)
                        .padding(.top, 20)
                    }
                    .padding([.leading, .trailing], 20)
                    
                    Spacer()
                }
            }
        }
        .navigationDestination(isPresented: $isShowCartView, destination: {
            CartView(isShowBackButton: true)
        })
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
        }), trailing:
                                Button(action: {
            isShowCartView = true
        }) {
            Image("shopping-cart")
                .frame(width: 30 ,height: 30, alignment: .center)
                .background(Color.app)
                .cornerRadius(2)
            //                .resizable()
            //                .frame(width: 11.43 ,height: 11.43)
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack{
                    Text("PRODUCT DETAIL")
                      .font(.customFont(font: .sfPro, style: .medium, size: 20))
                      .foregroundColor(.black)
                }
                .frame(height: 44)
            }
        }
    }
}

#Preview {
    ProductDetailView()
}
