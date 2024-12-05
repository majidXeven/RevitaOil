//
//  CheckOutView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI

struct CheckOutView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var companyName = ""
    @State var emailAddress = ""
    @State var country = ""
    @State var address = ""
    @State var city = ""
    @State var zipCode = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.dismiss) private var dismiss
    
    let products = [
        Product(name: "Pet Line-300 MG Tinc", category: "Chicken Flavor", price: 45, icon: "product1"),
        Product(name: "Sweet Dreams", category: "Chicken Flavor", price: 50, icon: "product2")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(products) { product in
                    SummaryItemView(product: product)
                }
                
                Text("Billing Details")
                    .font(.customFont(font: .sfPro, style: .medium, size: 20))
                
                HStack(spacing: 20) {
                    CustomTextFieldView(title: "First Name", placeholder: "First Name", showLeadingButton: true, leadingButtonImage: "userFilled", text: $firstName)
                    
                    CustomTextFieldView(title: "Last Name", placeholder: "Last Name", showLeadingButton: true, leadingButtonImage: "userFilled", text: $lastName)
                }
                
                CustomTextFieldView(title: "Company Name (optional)", placeholder: "Company Name", text: $companyName)
                
                CustomTextFieldView(title: "Email Address", placeholder: "Email Address", text: $emailAddress)
                    .keyboardType(.emailAddress)
                
                CustomTextFieldView(title: "Country", placeholder: "Country", showTrailingButton: true, trailingButtonImage: "arrowDown", isDropdwon: true, text: $country, onClickDropDown: {
                    country = "Pakistan"
                })
                
                CustomTextFieldView(title: "Address", placeholder: "Address", text: $address)
                
                HStack(spacing: 20) {
                    
                    CustomTextFieldView(title: "City", placeholder: "City", showTrailingButton: true, trailingButtonImage: "arrowDown", isDropdwon: true, text: $city, onClickDropDown: {
                        city = "Lahore"
                    })
                    
                    CustomTextFieldView(title: "Zip Code", placeholder: "Zip Code", text: $zipCode)
                    
                }
                
                CustomTextFieldView(title: "Passowrd", placeholder: "Enter Password", text: $password)
                
                CustomTextFieldView(title: "Confirm Passowrd", placeholder: "Enter Password", text: $confirmPassword)
                
                HStack(spacing: 20) {
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("CANCEL")
                                .foregroundColor(.white)
                                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                            Spacer()
                        }
                    })
                    
                    .frame(width: (screenWidth - 60) / 2, height: 50)
                    .background(Color(hex: "#FF0000"))
                    .cornerRadius(2)
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("DELIVER NOW")
                                .foregroundColor(.white)
                                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                            Spacer()
                        }
                    })
                    
                    .frame(width: (screenWidth - 60) / 2, height: 50)
                    .background(Color("buttonColor"))
                    .cornerRadius(2)
                }
                .padding(.top, 30)
                
            }
            
        }
        .padding(20)
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
                    Text("SUMMARY")
                      .font(.customFont(font: .sfPro, style: .medium, size: 20))
                      .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CheckOutView()
}
