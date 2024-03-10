//
//  AddProductViewController.swift
//  Calculator
//
//  Created by Huda M. A'abed on 03/03/2024.
//

import UIKit

protocol ProductDataDelegate: AnyObject {
     func addProduct(productName: String, productPrice: Double, productQuantity: Int)
}

class AddProductViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addNewProductView: UIView!
    @IBOutlet weak var txtProductName: UITextField!
    @IBOutlet weak var txtProductPrice: UITextField!
    @IBOutlet weak var txtQuantity: UITextField!
        
    public weak var delegate: ProductDataDelegate?
   // var productAdded: ((String, Double, Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localized()
        fetchData()
    }
    
    @IBAction func btnAddItem(_ sender: Any) {
//        guard let productName = txtProductName.text else { return  }
//        guard let productPrice = Double(txtProductPrice.text ?? "") else { return }
//        guard let productQuantity = Int(txtQuantity.text ?? "") else { return }

        guard let productName = txtProductName.text?.trimmingCharacters(in: .whitespaces), !productName.isEmpty else {
            print("Product name is empty")
            showAlertError(title: "خطأ", message: "يجب أن تدخل اسم المنتج")
            return
        }
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        guard namePredicate.evaluate(with: productName) else {
            showAlertError(title: "خطأ", message: "يجب أن يحتوي اسم المنتج على أحرف فقط")
            return
        }
        guard let productPriceText = txtProductPrice.text?.trimmingCharacters(in: .whitespaces), !productPriceText.isEmpty, let productPrice = Double(productPriceText) else {
            print("Product price is empty or invalid")
            showAlertError(title: "خطأ", message: "يجب أن تدخل سعر المنتج بشكل صحيح")
            return
        }
        
        guard let productQuantityText = txtQuantity.text?.trimmingCharacters(in: .whitespaces), !productQuantityText.isEmpty, let productQuantity = Int(productQuantityText), productQuantity > 0 else {
            print("Product quantity is empty or invalid")
            showAlertError(title: "خطأ", message: "يجب أن تدخل كمية المنتج بشكل صحيح")
            return
        }
         delegate?.addProduct(productName: productName, productPrice:  productPrice, productQuantity: productQuantity)
//        productAdded?(productName, productPrice, productQuantity)
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


extension AddProductViewController {
    func setupView(){
        addNewProductView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        addNewProductView.layer.cornerRadius = 30
        self.keyboardHideTextFiledSolution(showSelector: #selector(keyboardWillShow), hideSelector: #selector(keyboardWillHide))
    }
    
    func localized(){
    }
    
    func setupData(){
        hideKeyboardWhenTappedAround()
        
    }
    
    func fetchData(){
        
    }
}

extension AddProductViewController {
    
}

