//
//  CartVC.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit

final class CartVC: UIViewController, LoginVCDelegate {
    
    private var viewModel: CartViewModel!
    private let emptyView = UIEmptyCart()
    private let cartView = UICartView()
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.onUpdate = {
            self.fetchCart()
            self.cartView.tableView.reloadData()
        }
        self.fetchCart()
    }
    
    private func fetchCart() {
        viewModel.fetchCart { [weak self] response in
            guard let self = self else { return }
            cartView.cartItem = response
            cartView.priceLabel.text = "$\(response.reduce(0.0) { $0 + ($1.price ?? 0.0)})"
            cartView.tableView.reloadData()
        }
    }

    private func setViews() {
        if let isUserLogin = Global.isUserLogin, !isUserLogin.isEmpty {
            self.switchCartView()
        } else {
            self.switchEmptyView()
        }
    }
    
    private func switchEmptyView() {
        emptyView.delegate = self
        view = emptyView
    }
    
    private func switchCartView() {
        cartView.delegate = self
        view = cartView
        self.emptyView.removeFromSuperview()
    }
    
    func loginStatus() {
        self.dismiss(animated: true) {
            self.switchCartView()
        }
    }
}

extension CartVC : UIEmptyCartDelegate {
    func loginButtonTapped() {
        let vc = LoginVC(viewModel: DIContainer.instance.authViewModel())
        vc.delegate = self
        self.navigationController?.present(vc, animated: true)
    }
}

extension CartVC : UICartViewDelegate {
    func checkoutButtonTapped(_ cartItem: [Product], _ totalAmount: Double, _ totalCount: Int) {
        let alert1 = UIAlertController(title: "Success", message: "Buy is success", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "OK", style: .default)
            
        alert1.addAction(alertAction1)
        
        let alert = UIAlertController(title: "Confirm Cart", message: "Cart Total Amount: $\(totalAmount) for \(totalCount) products.", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "Checkout", style: .cancel) { (action) in
            self.viewModel.checkout(cartItem.first!) { status in
                self.viewModel.deleteCart()
                self.present(alert1, animated: true)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)

        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        

        
        self.present(alert,animated: true)
    }

}

