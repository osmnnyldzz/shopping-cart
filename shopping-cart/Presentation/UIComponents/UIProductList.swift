//
//  UIProductList.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit
import SnapKit

protocol UIProductListDelegate: AnyObject {
    func addToCartItem(sender:UIButton)
}

final class UIProductList: UIView {
    
    var products = [Product]()
    weak var delegate:UIProductListDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isUserInteractionEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(collectionView)
        
        self.setupCollectionView()
        self.setConstraints()
    }

    private func setupCollectionView(){
        self.collectionView.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: CategoryListCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func setConstraints() {
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8.0)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-8.0)
            make.leading.equalTo(snp.leading).offset(8.0)
            make.trailing.equalTo(snp.trailing).offset(-8.0)
        }
    }
    
}

extension UIProductList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return products.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCollectionViewCell.identifier, for: indexPath) as! CategoryListCollectionViewCell
            let data = products[indexPath.row]
            
            cell.delegate = self
            cell.productImage.kf.setImage(with: URL(string: data.image ?? "") )
            cell.productPrice.text = "$\(data.price ?? 0.0)"
            cell.productTitle.text = data.title ?? ""
            cell.addToCartButton.tag = indexPath.row
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (frame.width / 2) - 16, height: 240)
        }
        
}

extension UIProductList: CategoryListCollectionViewCellDelegate {
    func addToCartButtonTapped(sender: UIButton) {
        delegate?.addToCartItem(sender: sender)
    }
}
