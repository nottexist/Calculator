//
//  ViewController.swift
//  Calculator
//
//  Created by Huda M. A'abed on 02/03/2024.
//

import UIKit

class CalculatorViewController:
    UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgEmptyCart: UIImageView!
    @IBOutlet weak var stackNotEmpty: UIStackView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTotalWithTax: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    
    var products: [Products] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localized()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnAddProduct(_ sender: Any) {
        UserProfile.shared.setAppleLAnguageTo(lang: "en")
        let vc = AddProductViewController.instantiat()
            vc.delegate = self
//        vc.productAdded? = { [weak self] productName, productPrice, productQuantity in
//            self?.addProduct(productName: productName, productPrice: productPrice, productQuantity: productQuantity)
//        }
            vc.presenVC()
    }
    
    func calculations() {
        var totalPrice = products.reduce(0.0) { $0 + ($1.price * Double($1.quantity)) }
        let total = totalPrice
        let tax = total * 0.15
        let totalPlusTax = total + tax
        
        lblTotal.text = String(format: "%.2f", totalPrice)
        lblTax.text = String(format: "%.2f", tax)
        lblTotalWithTax.text = String(format: "%.2f", totalPlusTax)
    }
}

extension CalculatorViewController {
    func setupView(){
        hideKeyboardWhenTappedAround()
        tableView.registerXib(identifier: "ProductTableViewCell")
        stackNotEmpty.isHidden = false
    
    }
    
    func localized(){
        
    }
    
    func setupData(){
        hideKeyboardWhenTappedAround()
        if products.isEmpty {
            lblTotal.text = "0.0"
            lblTax .text = "0.0"
            lblTotalWithTax.text = "0.0"
        }
    }
    
    func fetchData(){
        
    }
}


extension CalculatorViewController: ProductDataDelegate
{
    func addProduct(productName: String, productPrice: Double, productQuantity: Int) {
        products.append(Products.init(quantity: productQuantity, price: productPrice, productName: productName))
        calculations()
        tableView.reloadData()
    }
}


extension CalculatorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.id, for: indexPath) as! ProductTableViewCell
        let object = products[indexPath.row]
        cell.object = object
        cell.configureXib()
        

        let price = self.products[indexPath.row].price
        let totalPrice = cell.delegate?.totalPrice(price: price)
        self.calculations()
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            calculations()
        }
    }
}
