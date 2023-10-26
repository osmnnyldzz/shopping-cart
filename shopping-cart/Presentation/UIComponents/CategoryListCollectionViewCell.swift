//
//  CategoryListCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

class CategoryListCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Test"
        lbl.textColor = .red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()   
    
    lazy var categoryBannerImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage(systemName: "house")
        imgView.contentMode = .scaleToFill
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
        }
        
        self.categoryBannerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
#Preview {
    CategoryListCollectionViewCell()
}
