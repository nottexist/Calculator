//
//  ProductTableViewCell.swift
//  Calculator
//
//  Created by Huda M. A'abed on 06/03/2024.
//

import UIKit

protocol onPriceUpdate: AnyObject {
    func totalPrice(price: Double)
    
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet var productView: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSub: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var txtQuantity: UITextField!
    
   
    weak var delegate: onPriceUpdate?
//    var onPriceUpdate: ((Double) -> Void)?
        var object: Products?
    
    
    @IBAction func btnSub(_ sender: Any) {
        if let quantity = txtQuantity.text, !quantity.isEmpty, var quantityInt = Int(quantity) {
            if quantityInt > 0 {
                quantityInt -= 1
                txtQuantity.text = "\(quantityInt)"
                let newPrice = calculatePrice(for: quantityInt)
                    //delegate?.totalPrice(price: newPrice)
            } else {
                print("Can't subtract from ZERO !!")
            }
        }
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if let quantity = txtQuantity.text, !quantity.isEmpty, var quantityInt = Int(quantity) {
                quantityInt += 1
                txtQuantity.text = "\(quantityInt)"
            let newPrice = calculatePrice(for: quantityInt)
                //delegate?.totalPrice(price: newPrice)
        }
    }
    
    @IBAction func txtQuantity(_ sender: Any) {
        if txtQuantity.text == nil {
            txtQuantity.text = "\(0)"
        }
        guard let quantity = txtQuantity.text else { return }
        let quantityInt = Int(quantity)
        let newPrice = calculatePrice(for: quantityInt ?? 0)
            //delegate?.totalPrice(price: newPrice)
    }
    
    func calculatePrice(for quantity: Int) -> Double {
        guard let price = object?.price else {
            return 0
        }
        var priceDouble = Double(price)
        let newPrice = priceDouble * Double(quantity)
            delegate?.totalPrice(price: newPrice)
        return newPrice
    }
    
    func configureXib() {
        if let object = self.object as? Products {
            lblProductName.text = object.productName
            txtQuantity.text = "\(object.quantity)"
            lblPrice.text = "\(object.price)"
        }
    }
    
}
