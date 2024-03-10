//
//  StringEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 19/04/2022.
//

import Foundation
import UIKit

extension String {
    
    //conver the String to UIcolor
//    var color_ : UIColor {
//        return UIColor.init(hexString: self)
    
    
    
    
    var color_ : UIColor {
        return UIColor.init(named : self) ?? UIColor.init(hexString: self)
        
    }
    
    //conver the previous code to cgcolor
    var colorcg_ : CGColor {
        return self.color_.cgColor
        
    }
    
    
    var color2_ : CGColor {
        return UIColor.init(hexString: self).cgColor
        
    }
    
    var image_ : UIImage? {
        return UIImage.init(named: self)
    }
    
    var removeWhiteSpace_: String{
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    var isValidValue: Bool{
        return !self.removeWhiteSpace_.isEmpty
    }
}

