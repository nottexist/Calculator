//
//  UITextField.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 10/08/2022.
//

import Foundation
import UIKit


extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    @IBInspectable var leadingPadding: CGFloat {
           get {
               return (leftView?.frame.size.width ?? 0) / frame.size.width
           }
           set {
               let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
               leftView = paddingView
               leftViewMode = .always
           }
       }
       
       @IBInspectable var trailingPadding: CGFloat {
           get {
               return (rightView?.frame.size.width ?? 0) / frame.size.width
           }
           set {
               let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
               rightView = paddingView
               rightViewMode = .always
           }
       }
       
       override open func layoutSubviews() {
           super.layoutSubviews()
           
           if let placeholder = placeholder, !placeholder.isEmpty {
               let language = NSLinguisticTagger.dominantLanguage(for: placeholder)
               let isArabic = language == "ar"
               
               if isArabic {
                   rightViewMode = .always
                   leftViewMode = .never
               } else {
                   leftViewMode = .always
                   rightViewMode = .never
               }
           }
       }
   }





///Change colorpalceholder . 
//@IBOutlet weak var txtFolder: UITextField!
//        didSet {
//            let PlaceholderText = NSAttributedString(string:"Search Folder",attributes: [NSAttributedString.Key.foregroundColor:"#22215B".color_])
//
//            txtFolder.attributedPlaceholder = PlaceholderText
//        }
//    }
