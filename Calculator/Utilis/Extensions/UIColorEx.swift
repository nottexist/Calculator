//
//  UIColorEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 19/04/2022.
//

import Foundation
import UIKit

extension UIColor {
    // Convert hex string and returns a UIColor 
    convenience init(hexString :String) {
    var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        self.init(
        red: 0 / 255.0,
        green: 0 / 255.0,
        blue: 0 / 255.0,
        alpha: 1  
    )
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
}
