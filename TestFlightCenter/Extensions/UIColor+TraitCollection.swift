//
//  UIColor+TraitCollection.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 14/2/21.
//

import UIKit
extension UIColor {
    convenience init (light: UIColor, dark: UIColor) {
        if #available(iOS 13.0, *) {
            self.init {
                $0.isLightModeOn ? light : dark
            }
        } else {
            self.init()
        }
    }
}
private extension UITraitCollection {
    var isLightModeOn: Bool { userInterfaceStyle == .light }
}


