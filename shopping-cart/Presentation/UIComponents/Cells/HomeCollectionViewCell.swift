//
//  HomeCollectionViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    lazy var categoryTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 36.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var categoryBannerImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo.on.rectangle")
        imgView.contentMode = .scaleToFill
        imgView.alpha = 0.35
        imgView.layer.cornerRadius = 8.0
        imgView.clipsToBounds = true
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
        
        self.contentView.addBorder()
        
        self.setConstraints()
        
    }
    
    private func setConstraints() {
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
