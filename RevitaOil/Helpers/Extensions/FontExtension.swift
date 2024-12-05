//
//  FontExtension.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import Foundation
import SwiftUI

enum CustomFonts: String {
    case lato = "Lato"
    case sfPro = "SFProText"
}

enum CustomFontStyle: String {
    case bold = "-Bold"
    case boldItalic = "-BoldItalic"
    case heavy = "-Heavy"
    case heavyItalic = "-HeavyItalic"
    case light = "-Light"
    case lightItalic = "-LightItalic"
    case medium = "-Medium"
    case mediumItalic = "-MediumItalic"
    case regular = "-Regular"
    case regularItalic = "-RegularItalic"
    case semiBold = "-SemiBold"
    case semiBoldItalic = "-SemiBoldItalic"
}

//enum CustomFontSize: CGFloat {
//    case h0 = 36.0
//    case h1 = 32.0
//    case h2 = 20.0
//    case h3 = 16.0
//    case h4 = 8.0
//}

extension Font {
    
    /// Choose your font to set up
    /// - Parameters:
    ///   - font: Choose one of your font
    ///   - style: Make sure the style is available
    ///   - size: Use prepared sizes for your app
    ///   - isScaled: Check if your app accessibility prepared
    /// - Returns: Font ready to show
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: Int,
        isScaled: Bool = true) -> Font {
            
            let fontName: String = font.rawValue + style.rawValue
            
            return Font.custom(fontName, size: CGFloat(size))
        }
}
