//
//  LoginVC.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit

protocol LoginVCDelegate: AnyObject {
    func loginStatus()
}

final class LoginVC: UIViewController {
    
    private var viewModel: LoginViewModel!
    weak var delegate: LoginVCDelegate!
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Login"
        self.setViews()
    }
    
    private func setViews() {
        let loginView = UILoginView()
        loginView.delegate = self
        view = loginView
    }
}

extension LoginVC: UILoginViewDelegate {
    func loginButtonTapped(username: String, password: String) {
        viewModel.login(username, password, {
            self.delegate?.loginStatus()
        })
    }
}
