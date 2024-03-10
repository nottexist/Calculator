//
//  NSNumberEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 03/07/2022.
//

import Foundation


extension Int {
    init(_ range: Range<Int> ) {
        let delta = range.startIndex < 0 ? abs(range.startIndex) : 0
        let min = UInt32(range.startIndex + delta)
        let max = UInt32(range.endIndex   + delta)
        self.init(Int(min + arc4random_uniform(max - min)) - delta)
    }
    var random: Int {
        let min = Int(pow(Double(10), Double(self-1))) - 1
        let max = Int(pow(Double(10), Double(self))) - 1
        return Int(Range(uncheckedBounds: (min, max)))
        
    }
}
