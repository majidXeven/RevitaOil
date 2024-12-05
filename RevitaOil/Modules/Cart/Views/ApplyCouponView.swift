//
//  ApplyCouponView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct ApplyCouponView: View {
    
    @State var couponCode = ""
    
    var body: some View {
        ZStack {
            HStack {
                TextField(
                    "Coupon Code",
                    text: $couponCode
                )
                .font(.customFont(font: .sfPro, style: .regular, size: 14))
                .padding()
                
                Button(action: {
                    // action to perform when the button is tapped
                }) {
                    Text("Apply")
                        .font(.customFont(font: .sfPro, style: .bold, size: 12))
                        .tint(.white)
                }
                .frame(width: 60 ,height: 30)
                .background(Color.init(hex: "#007537"))
                .cornerRadius(2)
                .padding(.trailing, 10)
            }
            
            .frame(height: 50)
            .background(Color.whiteSmoke)
            .cornerRadius(2)
        }
        .padding([.leading, .trailing], 20)
    }
}

#Preview {
    ApplyCouponView()
}
