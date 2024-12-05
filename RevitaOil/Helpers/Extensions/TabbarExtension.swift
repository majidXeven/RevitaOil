//
//  TabbarExtension.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import UIKit

//extension UITabBarController {
//    open override func viewDidLayoutSubviews() {
//        setupCustomTabBarFrame()
//    }
//    
//    open override func viewWillLayoutSubviews() {
//        setupTabBarUI()
//    }
//    
//    private func setupCustomTabBarFrame() {
//        let height = self.view.safeAreaInsets.bottom + 64
//        var tabFrame = self.tabBar.frame
//        tabFrame.size.height = height
//        tabFrame.origin.y = self.view.frame.size.height - height
//        
//        tabBar.frame = tabFrame
//        tabBar.setNeedsLayout()
//        tabBar.layoutIfNeeded()
//    }
//    
//    private func setupTabBarUI() {
//        // Setup your colors and corner radius
//        tabBar.layer.cornerRadius = 22
//        tabBar.layer.masksToBounds = true
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        tabBar.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)
//        tabBar.tintColor = #colorLiteral(red: 0.4670000076, green: 0.6430000067, blue: 0.3919999897, alpha: 1)
//        
//        // Remove the line
//        if #available(iOS 13.0, *) {
//            let appearance = tabBar.standardAppearance
//            appearance.shadowImage = nil
//            appearance.shadowColor = nil
//            tabBar.standardAppearance = appearance
//        } else {
//            tabBar.shadowImage = UIImage()
//            tabBar.backgroundImage = UIImage()
//        }
//    }
//    
////    func frameForTabAtIndex(index: Int) -> CGRect {
////        var frames = tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
////            if let view = view as? UIControl {
////                for item in view.subviews {
////                    if let image = item as? UIImageView {
////                        return image.superview!.convert(image.frame, to: tabBar)
////                    }
////                }
////                return view.frame
////            }
////            return nil
////        }
////        frames.sort { $0.origin.x < $1.origin.x }
////        if frames.count > index {
////            return frames[index]
////        }
////        return frames.last ?? CGRect.zero
////    }
////
////    public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
////        let index = -(tabBar.items?.firstIndex(of: item)?.distance(to: 0))!
////        let frame = frameForTabAtIndex(index: index)
////        circle?.center.x = frame.origin.x + frame.width/2
////        circle?.center.y = frame.origin.y + frame.height/2
////    }
//    
//}
