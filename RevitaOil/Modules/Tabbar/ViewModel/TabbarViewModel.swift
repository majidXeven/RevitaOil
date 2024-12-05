//
//  TabbarViewModel.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 30/04/2024.
//

import Foundation

class TabbarViewModel: ObservableObject {
    @Published var selectedIndex = 0
    
    func changeTab(index: Int) {
        self.selectedIndex = index
    }
}
