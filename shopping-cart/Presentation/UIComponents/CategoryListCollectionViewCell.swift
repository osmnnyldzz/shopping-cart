//
//  CategoryListCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

class CategoryListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryListCollectionViewCell"
    
    lazy var categoryTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Test"
        lbl.textColor = .red
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 24.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()   
    
    lazy var categoryBannerImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage(systemName: "house")
        imgView.contentMode = .scaleAspectFit
        imgView.alpha = 0.5
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupViews() {
        addSubview(categoryTitleLabel)
        addSubview(categoryBannerImageView)
        
        self.categoryTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        self.categoryBannerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}
#Preview {
    CategoryListCollectionViewCell()
}
