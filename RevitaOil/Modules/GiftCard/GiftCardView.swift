//
//  GiftCardView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 30/04/2024.
//

import SwiftUI
import PopupView
import UIKit

struct GiftCardView: View {
    
    @State var fullName = ""
    @State var emailAddress = ""
    @State var address = ""
    @State var phoneNo = ""
    @State var selectedIndex = -1
    @State var customValue = ""
    
    @State var showPopup: Bool = false
    
    @State var buttonsText = ["$ 50.00", "$ 75.00", "$ 100.00", "Custom"]
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack{
            Divider()
                .padding([.bottom], 10)
                .foregroundColor(Color(hex: "#544848"))
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
            
                    LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                        ForEach(0..<buttonsText.count, id: \.self) { index in
                            Button(action: {
                                selectedIndex = index
                                if index == 3 {
                                    self.showPopup.toggle()
                                }
                            }, label: {
                                Text(buttonsText[index])
                                    .foregroundColor(selectedIndex == index ? .white : Color(hex: "#707070"))
                                    .font(.customFont(font: .sfPro, style: .medium, size: 16))
                            })
                            .frame(width: (screenWidth - 50) / 2, height: 40)
                            .background(selectedIndex == index ? Color("buttonColor") : .clear)
                            .cornerRadius(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color(hex: "#CCCCCC"), lineWidth: 1)
                            )
                        }
                    }
                    
                    Text("Delivery Info")
                        .font(.customFont(font: .sfPro, style: .medium, size: 20))
                    
                    CustomTextFieldView(title: "Full Name", placeholder: "Full Name", text: $fullName)
                    
                    CustomTextFieldView(title: "Email Address", placeholder: "Email Address", text: $emailAddress)
                        .keyboardType(.emailAddress)
                    
                    CustomTextFieldView(title: "Address", placeholder: "Address", text: $address)
                    
                    CustomTextFieldView(title: "Phone No", placeholder: "Phone No", text: $phoneNo)
                        .keyboardType(.phonePad)
                    
                    Button(action: {
                        if isValidInput() {
                            
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            Text("BUY NOW")
                                .foregroundColor(.white)
                                .font(.customFont(font: .sfPro, style: .medium, size: 16))
                            Spacer()
                        }
                    })
                    .frame(width: screenWidth - 40, height: 50)
                    .background(Color("buttonColor"))
                    .cornerRadius(2)
                    .padding(.top, 30)
                    
                }
                .padding([.leading, .trailing], 20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("GIFT CARD")
                            .font(.customFont(font: .sfPro, style: .medium, size: 20))
                            .foregroundColor(.black)
                    }
                }
            }
            
            .fullScreenCover(isPresented: $showPopup, onDismiss: {
                if customValue == "" {
                    selectedIndex = -1
                    self.buttonsText[3] = "Custom"
                }else {
                    self.buttonsText[3] = customValue
                }
            }, content: {
                ZStack {
                    CustomGiftCardAmountView(onClickCancelButton: .constant({
                        self.showPopup = false
                        self.customValue = ""
                    }), onClickApplyFilterButton: .constant({
                        self.showPopup = false
                    }), value: $customValue)
                }
                
                .presentationBackground(.black.opacity(0.5))
            })
        }
    }
}

extension GiftCardView {
    func isValidInput() -> Bool {
        
        if !fullName.isValidInput() {
            showAlertView(title: "Error", message: "Please enter your full name.")
            return false
        }
        
        if !emailAddress.isValidEmail {
            showAlertView(title: "Error", message: "Please enter a valid email.")
            return false
        }
        
        if !address.isValidInput() {
            showAlertView(title: "Error", message: "Please enter your address.")
            return false
        }
        
        if !phoneNo.isValidInput() {
            showAlertView(title: "Error", message: "Please enter your phone number.")
            return false
        }
        
        return true
    }
    
   
}

#Preview {
    GiftCardView()
}


extension View {
    func showAlertView(title: String, message: String,
                                     successTitle: String = "OK",
                                     cancelTitle: String = "",
                                     successCallback : (()->())! = nil,
                                     cancelCallback : (()->())! = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if successTitle.count > 0 {
            alert.addAction(UIAlertAction(title: successTitle, style: UIAlertAction.Style.default, handler: {
                action in
                
                if successCallback != nil {
                    successCallback()
                }
            }))
        }
        
        if cancelTitle.count > 0 {
            alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.default, handler: {
                action in
                if cancelCallback != nil {
                    cancelCallback()
                }
            }))
        }
        
        DispatchQueue.main.async {
            let viewController = UIApplication.shared.windows.first!.rootViewController!
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
