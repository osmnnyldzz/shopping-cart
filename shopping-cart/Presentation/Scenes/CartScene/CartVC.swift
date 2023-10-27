//
//  CartVC.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit

class CartVC: UIViewController {
    
    private var viewModel: CartViewModel!
    private var cartItem = [CartItem]()
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
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
    
    private lazy var tableView: UITableView = {
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
    
    private lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.text = "$471.00"
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
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        viewModel.fetchCart { [weak self] response in
            guard let self = self else { return }
            self.cartItem = response
            self.tableView.reloadData()
        }
        
        view.addSubview(baseView)
        view.addSubview(baseColumn)
        
        baseView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
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
            make.height.equalTo(baseView.snp.height).multipliedBy(0.1)
        }
        
        priceAreaColumn.snp.makeConstraints { make in
            make.height.equalTo(baseView.snp.height).multipliedBy(0.075)
        }
        
        checkoutButton.snp.makeConstraints { make in
            make.height.equalTo(baseView.snp.height).multipliedBy(0.075)
        }
    }

}

extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItem.count
    }
}

//#Preview {
//CartVC(viewModel: DIContainer.instance.cartViewModel())
//}
