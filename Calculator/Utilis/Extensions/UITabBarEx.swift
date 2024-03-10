//
//  UITabBarEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 04/07/2022.
//

import Foundation
import UIKit

extension UITabBar {
  @IBInspectable  var nonSelectedColor: UIColor?{
        set {
            self.unselectedItemTintColor = newValue
        }
        get {
           return self.unselectedItemTintColor
    
        }
    }
    
    
    @IBInspectable var isRenderOriginal: Bool   {
          set {
              guard newValue != false else     { return }
              for (index, item) in (self.items ?? []).enumerated(){
                  let image = item.selectedImage?.withRenderingMode(.alwaysOriginal)
                  self.items?[index].selectedImage = image
              }
              
          }
              get {
                 return false
}
    }
}
