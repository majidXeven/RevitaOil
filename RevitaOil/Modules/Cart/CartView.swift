//
//  CartView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowCheckOutView = false
    @State var isShowBackButton = false
    @State var isShowAlert = false
    
    let products = [
        Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 45, icon: "product1"),
        Product(name: "Sweet Dreams", category: "Chicken Flavor", price: 50, icon: "product2"),
        Product(name: "Salt Chews", category: "Chicken Flavor", price: 55, icon: "product3")
    ]
    
    var body: some View {
        
        
        ScrollView {
            VStack(spacing: 10) {
                Divider()
                    .padding(0)
                    .foregroundColor(Color(hex: "#544848"))
                
                ForEach(products) { product in
                    CartItemView(product: product, onClickDeleteButton: .constant({
                        isShowAlert = true
                    }))
                }
                .padding([.bottom, .top], 10)
                
                //            List(products) { product in
                //                CartItemView(product: product)
                //                    .listRowSeparator(.hidden)
                //                    .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                //            }
                //            .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
                //            .listStyle(.plain)
                
                PaymentDetailView(title: "Subtotal", value: "$ 95.00")
                
                PaymentDetailView(title: "Delivery Fee", value: "$ 5.00")
                
                PaymentDetailView(title: "Discount", value: "50 %")
                
                PaymentDetailView(isShowTotalPaymentView: true, title: "Total", value: "$ 50.00")
                    .padding([.top, .bottom], 10)
                
                ApplyCouponView()
                
                Button(action: {
                    self.isShowCheckOutView = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("CHECKOUT")
                            .foregroundColor(.white)
                            .font(.customFont(font: .sfPro, style: .medium, size: 16))
                        Spacer()
                    }
                })
                .frame(width: screenWidth - 40, height: 50)
                .background(Color("buttonColor"))
                .cornerRadius(2)
                
                Spacer()
                
            }
        }
        .alert(isPresented: $isShowAlert, content: {
            Alert(title: Text("Alert"), message: Text("Are you sure, you want to delete this item?"))
        })
        .navigationDestination(isPresented: $isShowCheckOutView, destination: {
            CheckOutView()
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            if isShowBackButton {
                Image(systemName: "chevron.left")
                //                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.black)
            }
        })
                            , trailing: Image(systemName: "")
            .font(.system(size: 20))
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack{
                    Text("YOUR CART")
                        .font(.customFont(font: .sfPro, style: .medium, size: 20))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CartView()
}
