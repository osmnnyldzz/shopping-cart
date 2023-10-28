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
        if let isUserLogin = Global.isUserLogin, isUserLogin.isEmpty {
            self.switchEmptyView()
        } else {
            self.switchCartView()
        }
    }
    
    private func switchEmptyView() {
        emptyView.delegate = self
        view = emptyView
    }
    
    private func switchCartView() {
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

