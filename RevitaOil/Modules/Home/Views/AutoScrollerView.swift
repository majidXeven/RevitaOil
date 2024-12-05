//
//  AutoScrollerView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 26/04/2024.
//

import Foundation
import SwiftUI

struct AutoScrollerView: View {
    var imageNames: [String]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<imageNames.count, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            Image("\(imageNames[index])")
                                .resizable()
                                .tag(index)
                                .frame(height: 130)
                        }
                    }
                }
                .frame(height: 130)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(selectedImageIndex == index ? Color(hex: "#979797") : Color(hex: "#D9D9D9"))
                        .frame(width: 15.42, height: 3.56)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
            }
        }
    }
}

#Preview {
    AutoScrollerView(imageNames: ["bannerImage1", "bannerImage2", "bannerImage3"])
}
