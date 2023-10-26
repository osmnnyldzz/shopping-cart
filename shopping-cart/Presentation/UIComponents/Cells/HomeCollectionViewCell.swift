//
//  HomeCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    lazy var categoryTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .purple
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 36.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()   
    
    lazy var categoryBannerImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo.on.rectangle")
        imgView.contentMode = .scaleToFill
        imgView.alpha = 0.2
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8.0
        imgView.clipsToBounds = true
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
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.cornerRadius = 8
        
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
    HomeCollectionViewCell()
}
