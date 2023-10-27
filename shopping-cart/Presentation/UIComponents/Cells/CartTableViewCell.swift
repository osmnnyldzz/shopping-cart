//
//  CartTableViewCell.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    static let identifier = "CartTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var baseColumn: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.spacing = 8
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var productImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .blue
        img.image = UIImage(systemName: "photo.on.rectangle")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var infoAreaColumn: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.backgroundColor = .green
        sv.spacing = 8
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var productTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Test"
        return lbl
    }()
    
    private lazy var priceTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Test"
        return lbl
    }()
    
    private func setupUI() {
        addSubview(baseView)
        addSubview(baseColumn)
        
        setConstraints()
    }
    
    private func setConstraints() {
        baseView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        baseColumn.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(12)
            make.bottom.equalTo(baseView.snp.bottom).offset(-12)
            make.leading.equalTo(baseView.snp.leading).offset(12)
            make.trailing.equalTo(baseView.snp.trailing).offset(-12)
        }
        
        infoAreaColumn.addArrangedSubview(productTitleLabel)
        infoAreaColumn.addArrangedSubview(priceTitleLabel)
        
        baseColumn.addArrangedSubview(productImage)
        baseColumn.addArrangedSubview(infoAreaColumn)
        
        productImage.snp.makeConstraints { make in
            make.width.equalTo(baseView.snp.width).multipliedBy(0.35)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}

#Preview {
    CartTableViewCell(style: .default, reuseIdentifier: "")
}
