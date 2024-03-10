//
//  UIButtonEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 03/07/2022.
//

import Foundation
import UIKit


extension UIButton {
    @IBInspectable  var selectedImage: UIImage?{
        set {
            self.setImage(newValue, for: .selected)
        }
        get {
            return self.image(for: .selected)
            
        }
    }
    
//    @IBInspectable var leadingImage: CGFloat {
//        set {
//            if UserProfile.shared.isRTL{
//                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -1 * newValue)
//            } else{
//                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -1 * newValue, bottom: 0, right: 0)
//            }
//        }
//        get {
//            return 0
//        }
//    }
//
//    @IBInspectable var trailingImage: CGFloat {
//        set {
//            if UserProfile.shared.isRTL{
//                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -1 * newValue, bottom: 0, right: newValue)
//            } else{
//                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: newValue)
//            }
//        }
//        get {
//            return 0
//        }
//    }
}
