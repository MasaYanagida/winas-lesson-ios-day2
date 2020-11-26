//
//  UIColor+Util.swift
//  Day2Sample
//
//  Created by 柳田昌弘 on 2020/11/24.
//

import UIKit

extension UIColor {
    static func hexColor(_ hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        let r = CGFloat((hex >> 16) & 0xFF) / 255.0
        let g = CGFloat((hex >> 8) & 0xFF) / 255.0
        let b = CGFloat(hex & 0xFF) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
