//
//  Product.swift
//  Calculator
//
//  Created by Huda M. A'abed on 03/03/2024.
//

//import UIKit
//import Foundation
//
//
//class Product: UIView {
//
//    @IBOutlet weak var lblProductName: UILabel!
//
//    @IBOutlet var productView: UIView!
//    @IBOutlet weak var btnAdd: UIButton!
//    @IBOutlet weak var btnSub: UIButton!
//    @IBOutlet weak var lblPrice: UILabel!
//    @IBOutlet weak var txtQuantity: UITextField!
//
//
//    var onPriceUpdate: ((Double) -> Void)?
//    var object: Products?
//
//
//    @IBAction func btnSub(_ sender: Any) {
//        if let quantity = txtQuantity.text, !quantity.isEmpty, var quantityInt = Int(quantity) {
//            if quantityInt > 0 {
//                quantityInt -= 1
//                txtQuantity.text = "\(quantityInt)"
//                onPriceUpdate?(calculatePrice(for: quantityInt))
//            } else {
//                print("Can't subtract from ZERO !!")
//            }
//        }
//    }
//
//    @IBAction func btnAdd(_ sender: Any) {
//        if let quantity = txtQuantity.text, !quantity.isEmpty, var quantityInt = Int(quantity) {
//                quantityInt += 1
//                txtQuantity.text = "\(quantityInt)"
//            onPriceUpdate?(calculatePrice(for: quantityInt))
//        }
//    }
//
//    @IBAction func txtQuantity(_ sender: Any) {
//        if txtQuantity.text == nil {
//            txtQuantity.text = "\(0)"
//        }
//        guard let quantity = txtQuantity.text else { return }
//        let quantityInt = Int(quantity)
//        onPriceUpdate?(calculatePrice(for: quantityInt ?? 0))
//    }
//
//    func calculatePrice(for quantity: Int) -> Double {
//        guard let price = object?.price else {
//            return 0
//        }
//        var priceDouble = Double(price)
//            let newPrice = priceDouble * Double(quantity)
////            lblPrice.text = "\(newPrice)"
//            onPriceUpdate?(newPrice)
//        return newPrice
//    }
//
//    func configureData() {
//        if let object = self.object as? Products {
//            lblProductName.text = object.productName
//            txtQuantity.text = "\(object.quantity)"
//            lblPrice.text = "\(object.price)"
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureXib()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configureXib()
//    }
//
//     private func configureXib(){
//        Bundle.main.loadNibNamed("Product", owner: self, options: [:])
//        productView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        productView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(productView)
//
//        productView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        productView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        productView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        productView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        productView.layoutIfNeeded()
//    }
//}
