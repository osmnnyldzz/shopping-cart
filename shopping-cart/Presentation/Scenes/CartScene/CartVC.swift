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
    private lazy var completeAlert = UIAlertController()
    private lazy var checkoutAlert = UIAlertController()
    private lazy var errorAlert = UIAlertController()
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.onUpdate = {
            self.fetchCart()
            self.cartView.tableView.reloadData()
        }
        self.fetchCart()
        self.setViews()
    }
    
    private func fetchCart() {
        viewModel.fetchCart { [weak self] response in
            guard let self = self else { return }
            cartView.cartItem = response
            cartView.priceLabel.text = "$\(response.reduce(0.0) { $0 + ($1.price ?? 0.0)}.roundedToTwoDecimalPlaces())"
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
        self.navigationItem.setRightBarButton(nil, animated: true)
    }
    
    private func switchCartView() {
        cartView.delegate = self
        view = cartView
        self.emptyView.removeFromSuperview()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(logout))
    }
    
    func loginStatus() {
        self.dismiss(animated: true) {
            self.switchCartView()
        }
    }
    
    @objc func logout(){
        viewModel.logout {
            if let isUserLogin = Global.isUserLogin, !isUserLogin.isEmpty {
                self.switchCartView()
            } else {
                self.switchEmptyView()
            }
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
    func checkoutButtonTapped(_ cartItem: [Product], _ totalAmount: Double) {
        if cartItem.count > 0 {
            self.completeAlertActions()
            self.checkoutAlert(cartItem,totalAmount)
        } else {
            self.errorAlertActions()
        }
        
    }
}

// Alert
extension CartVC {
    private func errorAlertActions() {
        errorAlert = UIAlertController(title: "Error",
                                          message: "There are no products in your cart.",
                                          preferredStyle: .alert)
        
        errorAlert.addAction(title: "Okay",style: .destructive)
        
        self.present(errorAlert, animated: true, completion: nil)

    }
    
    private func completeAlertActions() {
        completeAlert = UIAlertController(title: "Success",
                                          message: "Shopping Completed",
                                          preferredStyle: .alert)
        
        completeAlert.addAction(title: "Okay")
    }
    
    private func checkoutAlert(_ cartItem: [Product], _ totalAmount: Double) {
        checkoutAlert = UIAlertController(title: "Confirm Cart",
                                          message: "Cart Total Amount: $\(totalAmount.roundedToTwoDecimalPlaces()) for \(cartItem.count) products.",
                                          preferredStyle: .actionSheet)
        
        
        
        checkoutAlert.addAction(title: "Checkout") { (action) in
            self.viewModel.checkout(cartItem) { status in
                self.viewModel.deleteCart()
                self.present(self.completeAlert, animated: true)
            }
        }
        
        checkoutAlert.addAction(title: "Cancel",style: .destructive)
        
        self.present(checkoutAlert, animated: true, completion: nil)
    }
}

