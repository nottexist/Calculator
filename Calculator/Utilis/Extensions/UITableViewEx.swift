//
//  UITableViewEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 24/07/2022.
//

import Foundation
import UIKit

extension UITableView{
    func registerXib(identifier: String){
        self.register(UINib.init(nibName: identifier , bundle: nil), forCellReuseIdentifier: identifier)
        
    }
     
    func registerXib(cell: UITableViewCell.Type){
        self.registerXib(identifier: String(describing: cell.self))
        
        
    }
}

extension UITableViewCell {
    static var id: String {
        return String(describing: Self.self)
    }
}
