//
//  CategoryListCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

protocol CategoryListCollectionViewCellDelegate {
    func addToCartButtonTapped(sender:UIButton)
}

final class CategoryListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryListCollectionViewCell"
    var delegate: CategoryListCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var baseContainer: UIView = {
       let view = UIView()
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.5
        return view
    }()
    
    lazy var baseColumn: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var priceAreaColumn: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var productTitle: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 3
        lbl.sizeToFit()
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var productImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var productPrice: UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 13.0)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()    
    
    lazy var addToCartButton: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(systemName: "cart.fill.badge.plus"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private func setupUI() {
        priceAreaColumn.addArrangedSubview(productPrice)
        priceAreaColumn.addArrangedSubview(addToCartButton)
        
        baseColumn.addArrangedSubview(productImage)
        baseColumn.addArrangedSubview(productTitle)
        baseColumn.addArrangedSubview(priceAreaColumn)
        
        addSubview(baseContainer)
        addSubview(baseColumn)
        
        setConstraints()
    }
    
    private func setConstraints() {
        baseContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        baseColumn.snp.makeConstraints { make in
            make.top.equalTo(baseContainer.snp.top).offset(8)
            make.bottom.equalTo(baseContainer.snp.bottom).offset(-8)
            make.leading.equalTo(baseContainer.snp.leading).offset(8)
            make.trailing.equalTo(baseContainer.snp.trailing).offset(-8)
        }
        
        productImage.snp.makeConstraints { make in
            make.height.equalTo(baseColumn.snp.height).multipliedBy(0.6)
        }
        
        productTitle.snp.makeConstraints { make in
            make.height.equalTo(baseColumn.snp.height).multipliedBy(0.3)
        }
        
        priceAreaColumn.snp.makeConstraints { make in
            make.height.equalTo(baseColumn.snp.height).multipliedBy(0.1)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.width.equalTo(priceAreaColumn.snp.width).multipliedBy(0.3)
        }
    }
    
    @objc private func addToCartButtonTapped(sender:UIButton) {
        delegate?.addToCartButtonTapped(sender: sender)
    }
}
