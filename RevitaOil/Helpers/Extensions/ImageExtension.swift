//
//  ImageExtension.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 10/05/2024.
//

import Foundation
import SwiftUI

extension UIImage {
    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 0.5, height: 0.5)
        //    Or if you need a thinner border :
        //    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context!.setFillColor(color.cgColor)
        context!.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}
