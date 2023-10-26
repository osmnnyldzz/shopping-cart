//
//  CategoryListCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

final class CategoryListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryListCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var baseColumn: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .red
        return stackView
    }()
    
    lazy var priceAreaColumn: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .green
        return stackView
    }()
    
    lazy var productImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    lazy var productPrice: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        return lbl
    }()    
    
    lazy var addToCartButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add To Cart", for: .normal)
        btn.backgroundColor = .green
        return btn
    }()
    
    private func setupUI() {
        addSubview(baseColumn)
        
        baseColumn.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(8.0)
            make.bottom.equalTo(snp.bottom).offset(-8.0)
            make.leading.equalTo(snp.leading).offset(8.0)
            make.trailing.equalTo(snp.trailing).offset(-8.0)
        }
        
        
        baseColumn.addArrangedSubview(productImage)
        baseColumn.addArrangedSubview(priceAreaColumn)
        
        productImage.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

    }
    
}

#Preview {
    CategoryListCollectionViewCell()
}
