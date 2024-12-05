//
//  AutoScrollProductImagesView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct AutoScrollProductImagesView: View {
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
                                .aspectRatio(contentMode: .fit)
                                .tag(index)
                        }
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(selectedImageIndex == index ? Color(hex: "#221F1F") : Color(hex: "#ABABAB"))
                        .frame(width: 8, height: 8)
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
    AutoScrollProductImagesView(imageNames: ["product1", "product2", "product3", "product4"])
}
