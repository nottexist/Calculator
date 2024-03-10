//
//  UserProfile.swift
//  Calculator
//
//  Created by Huda M. A'abed on 09/03/2024.
//

import Foundation
import UIKit

class UserProfile {
    static let shared = UserProfile()
    
    let APPLE_LANGUAGE_KEY = "AppleLanguages"
    
    var isRTL: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
    
    var currentLanguage: String? {
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? Array<String>
        return (langs?.first)
    }
    
    func currentAppleLanguage() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentwithoutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        return currentwithoutLocale
    }

    func currentAppleLanguageFul1() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
    func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang, currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }
}
