//
//  ProductListVC.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class ProductListVC: UIViewController, LoginVCDelegate {

    private var viewModel: ProductListViewModel!
    lazy var productListView = UIProductList()
    var products = [Product]()

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productListView.products = self.products
        productListView.delegate = self
        view = productListView
    }
    
    func loginStatus() {
        self.dismiss(animated: true) {
            let alertController = UIAlertController(title: "Success", 
                                                    message: "You have successfully logged in",
                                                    preferredStyle: .alert)
            
            alertController.addAction(title: "Okay")
            
            self.present(alertController,
                         animated: true,
                         completion: nil)
        }
    }
}

extension ProductListVC: UIProductListDelegate {
    func addToCartItem(sender: UIButton) {
        if let isUserLogin = Global.isUserLogin, !isUserLogin.isEmpty {
            viewModel.addToCartItem(products[sender.tag]) { status in
                
                let alertController = UIAlertController(title: "Success", 
                                                        message: "Product added to cart",
                                                        preferredStyle: .alert)
                
                alertController.addAction(title: "Okay")
                alertController.addAction(title: "Go To Cart") { (action) in
                    if let tabBarController = self.tabBarController {
                        tabBarController.selectedIndex = 1
                    }
                }

                self.present(alertController, animated: true, completion: nil)
            }
        } else {
            let vc = LoginVC(viewModel: DIContainer.instance.authViewModel())
            vc.delegate = self
            self.present(vc, animated: true)
        }
        
    }
}
