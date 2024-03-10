//
//  MainNavigationViewController.swift
//  Calculator
//
//  Created by Huda M. A'abed on 02/03/2024.
//

import UIKit

class MainNanigationViewController: UINavigationController  {
    
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
}

extension MainNanigationViewController {
    func setupView(){
        AppDelegate.shared?.rootNavigationController = self
         setRoot()
        if #available(iOS 15 , *) {
            let apperance = UINavigationBarAppearance()
            apperance.configureWithOpaqueBackground()
            apperance.backgroundColor = "#FFFFFF".color_
            //apperance.shadowColor = .clear
//            apperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : "#22215B".color_ , NSAttributedString.Key.font:UIFont.init(name: "Gilroy-Bold", size: 16)]
            self.navigationBar.standardAppearance = apperance
            self.navigationBar.scrollEdgeAppearance = apperance
            
        } else {
            self.navigationBar.isTranslucent = false
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.barTintColor = "#FFFFFF".color_
            self.navigationBar.backgroundColor = "#FFFFFF".color_
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : "#22215B".color_ , NSAttributedString.Key.font:UIFont.init(name: "Gilroy-Bold", size: 16)]
                                                      
        }
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.tintColor = "#22215B".color_
        
        
        
       }
    }
    
    func localized(){
        
        
    }
    
    func setupData(){
        
    }
    
    func fetchData(){
    }




extension MainNanigationViewController {
    func setRoot(){
        let vc = UIStoryboard.mainStorybored.instantiateViewController(withIdentifier:"CalculatorViewController")
        vc.rootPush()
        

   }

     
}
