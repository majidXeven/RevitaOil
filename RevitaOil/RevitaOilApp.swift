//
//  RevitaOilApp.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import SwiftUI

@main
struct RevitaOilApp: App {
    
    @State var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    TabbarView()
                }else {
                    Image("logo")
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
