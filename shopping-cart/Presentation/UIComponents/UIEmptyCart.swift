//
//  UIEmptyCart.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit
import SnapKit

protocol UIEmptyCartDelegate: AnyObject {
    func loginButtonTapped()
}

final class UIEmptyCart: UIView {
    
    weak var delegate:UIEmptyCartDelegate?

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
        sv.distribution = .fill
       return sv
    }()
    
    private lazy var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "You must be a member to shop."
       return lbl
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.addBorder()
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        btn.setTitle("Login/Register", for: .normal)
        return btn
    }()

    private func setupUI() {
        backgroundColor = .white
        
        self.addSubview(baseView)
        self.addSubview(baseColumn)
        self.baseColumn.addArrangedSubview(titleLabel)
        self.baseColumn.addArrangedSubview(loginButton)
        
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
            make.height.equalTo(baseView.snp.height).multipliedBy(0.4)
            make.leading.equalTo(baseView.snp.leading).offset(32)
            make.trailing.equalTo(baseView.snp.trailing).offset(-32)
        }
        self.loginButton.snp.makeConstraints { make in
            make.height.equalTo(baseColumn.snp.height).multipliedBy(0.15)
        }
    }
    
    @objc func loginButtonTapped() {
        self.delegate?.loginButtonTapped()
    }
}
