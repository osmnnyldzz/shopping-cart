//
//  UICartView.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit
import Kingfisher

protocol UICartViewDelegate : AnyObject {
    func checkoutButtonTapped(_ cartItem: [Product], _ totalAmount: Double,_ totalCount:Int)
}

final class UICartView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: UICartViewDelegate?
    
    var cartItem = [Product]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        let data = cartItem[indexPath.row]
        cell.productImage.kf.setImage(with: URL(string: data.image ?? ""))
        cell.priceTitleLabel.text = "$\(data.price ?? 0.0)"
        cell.productTitleLabel.text = data.title ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItem.count
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var baseView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var baseColumn: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.spacing = 8
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private lazy var myCartTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "My Cart"
        lbl.font = UIFont.systemFont(ofSize: 36)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private lazy var priceAreaColumn: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var totalTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Total"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 36)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var checkoutButton: UIButton = {
        let btn = UIButton()
        btn.layer.borderColor = UIColor.systemGray.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 4
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Checkout", for: .normal)
        btn.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private func setupUI() {
        self.tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        backgroundColor = .white
        
        addSubview(baseView)
        addSubview(baseColumn)
        
        baseView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
        
        baseColumn.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(12)
            make.bottom.equalTo(baseView.snp.bottom).offset(-12)
            make.leading.equalTo(baseView.snp.leading).offset(12)
            make.trailing.equalTo(baseView.snp.trailing).offset(-12)
        }
        
        priceAreaColumn.addArrangedSubview(totalTitleLabel)
        priceAreaColumn.addArrangedSubview(priceLabel)
        
        baseColumn.addArrangedSubview(myCartTitleLabel)
        baseColumn.addArrangedSubview(tableView)
        baseColumn.addArrangedSubview(priceAreaColumn)
        baseColumn.addArrangedSubview(checkoutButton)
        
        myCartTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(snp.height).multipliedBy(0.1)
        }
        
        priceAreaColumn.snp.makeConstraints { make in
            make.height.equalTo(snp.height).multipliedBy(0.075)
        }
        
        checkoutButton.snp.makeConstraints { make in
            make.height.equalTo(snp.height).multipliedBy(0.075)
        }
    }
    
    @objc func checkoutButtonTapped() {
        delegate?.checkoutButtonTapped(cartItem, cartItem.reduce(0.0) { $0 + ($1.price ?? 0.0)}, cartItem.count)
    }
}
