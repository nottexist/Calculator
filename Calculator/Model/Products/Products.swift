//
//  Product.swift
//  Calculator
//
//  Created by Huda M. A'abed on 04/03/2024.
//

import Foundation

class Products {
    var quantity: Int = 0
    var price: Double = 0.0
    var productName: String
    
    init(quantity: Int, price: Double, productName: String){
        self.quantity = quantity
        self.productName = productName
        self.price = price
    }
}
