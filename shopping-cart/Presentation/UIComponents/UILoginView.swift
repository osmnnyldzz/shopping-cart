//
//  UILoginView.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit
import SnapKit

protocol UILoginViewDelegate : AnyObject {
    func loginButtonTapped(username:String, password:String)
}

final class UILoginView: UIView {
    
    weak var delegate: UILoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var baseColumn: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var imgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.and.background.dotted")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var loginAreaColumn: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.distribution = .fillProportionally
        return sv
    }()
    
    private lazy var userField: UITextField = {
        let txtField = UITextField()
        txtField.addBorder()
        txtField.placeholder = "Username"
        txtField.text = "derek" // Demo Account
        txtField.backgroundColor = .white
        return txtField
    }()
    
    private lazy var passwordField: UITextField = {
        let txtField = UITextField()
        txtField.addBorder()
        txtField.placeholder = "Password"
        txtField.text = "jklg*_56" // Demo Account
        txtField.backgroundColor = .white
        return txtField
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.addBorder()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var demoAccountsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Demo Account Information\n"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    private func setupUI() {
        backgroundColor = .white
        self.addSubview(baseView)
        self.addSubview(baseColumn)
        
        self.loginAreaColumn.addArrangedSubview(userField)
        self.loginAreaColumn.addArrangedSubview(passwordField)
        self.loginAreaColumn.addArrangedSubview(loginButton)
        self.loginAreaColumn.addArrangedSubview(demoAccountsLabel)
        
        self.baseColumn.addArrangedSubview(imgView)
        self.baseColumn.addArrangedSubview(loginAreaColumn)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.baseView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
        
        self.baseColumn.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(16)
            make.bottom.equalTo(baseView.snp.bottom).offset(-16)
            make.width.equalTo(baseView.snp.height).multipliedBy(0.4)
            make.centerX.equalTo(baseView.snp.centerX)
        }
        
        self.passwordField.snp.makeConstraints { make in
            make.height.equalTo(loginAreaColumn.snp.height).multipliedBy(0.15)
        }
        
        self.userField.snp.makeConstraints { make in
            make.height.equalTo(loginAreaColumn.snp.height).multipliedBy(0.15)
        }
        
        self.loginButton.snp.makeConstraints { make in
            make.height.equalTo(loginAreaColumn.snp.height).multipliedBy(0.15)
        }
    }
    
    @objc func loginButtonTapped() {
        self.delegate?.loginButtonTapped(username: self.userField.text ?? "",
                                         password: self.passwordField.text ?? "")
    }
}
