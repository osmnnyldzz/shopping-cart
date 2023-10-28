//
//  UIHomeView.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit
import SnapKit

protocol UIHomeViewDelegate: AnyObject {
    func categoryTapped(categoryName:String)
}

final class UIHomeView: UIView {
    
    var categories: Categories?
    weak var delegate: UIHomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
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
    
    private func setupCollectionView() {
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setConstraints() {
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(snp.leading).offset(8.0)
            make.trailing.equalTo(snp.trailing).offset(-8.0)
        }
    }
}

extension UIHomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.categoryTitleLabel.text = self.categories?.categories[indexPath.row]
        cell.categoryBannerImageView.image = self.categories?.categoryImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 16, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.categoryTapped(categoryName:self.categories?.categories[indexPath.row] ?? "")
    }
}

