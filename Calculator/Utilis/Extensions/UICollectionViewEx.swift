//
//  UICollectionViewEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 24/07/2022.
//

import Foundation
import UIKit


extension UICollectionView{
    func registerXib(identifier: String){
        self.register(UINib.init(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
     
    func registerXib(cell: UICollectionViewCell.Type){
        self.registerXib(identifier: String(describing: cell.self))
        
        
    }
    
}


extension UICollectionViewCell {
    static var id: String {
        return String(describing: Self.self)
    }
}
