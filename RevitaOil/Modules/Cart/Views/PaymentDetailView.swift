//
//  PaymentDetailView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct PaymentDetailView: View {
    
    @State var isShowTotalPaymentView: Bool = false
    @State var title: String = "Subtotal"
    @State var value: String = "$ 95.00"
    
    var body: some View {
        VStack {
            if isShowTotalPaymentView {
                HStack {
                    Text("\(title):")
                        .font(.customFont(font: .sfPro, style: .bold, size: 16))
                        .foregroundColor(Color.init(hex: "#221F1F"))
                    
                    Spacer()
                    
                    Text("\(value)")
                        .font(.customFont(font: .sfPro, style: .bold, size: 20))
                        .foregroundColor(Color.init(hex: "#007537"))
                }
            }else {
                HStack {
                    Text("\(title):")
                        .font(.customFont(font: .sfPro, style: .bold, size: 16))
                        .foregroundColor(Color.init(hex: "#6A6969"))
                    
                    Spacer()
                    
                    Text("\(value)")
                        .font(.customFont(font: .sfPro, style: .bold, size: 16))
                        .foregroundColor(Color.init(hex: "#221F1F"))
                }
            }
        }
        .padding([.leading, .trailing], 20)
    }
}

#Preview {
    PaymentDetailView()
}
