//
//  CategoryListViewController.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CategoryListViewController: UIViewController {
    
    private var viewModel: CategoryListViewModel!
    var products = [Product]()
    
    init(viewModel: CategoryListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isUserInteractionEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(collectionView)

        setupCollectionView()
        setConstraints()
    }
    
    
    private func setupCollectionView(){
        self.collectionView.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: CategoryListCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func setConstraints() {
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8.0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8.0)
            make.leading.equalTo(self.view.snp.leading).offset(8.0)
            make.trailing.equalTo(self.view.snp.trailing).offset(-8.0)
          
        }
    }
    
}

extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCollectionViewCell.identifier, for: indexPath) as! CategoryListCollectionViewCell
        let data = products[indexPath.row]
        
        cell.delegate = self
        cell.productImage.kf.setImage(with: URL(string: data.image ?? "") )
        cell.productPrice.text = "\(data.price ?? 0.0) TL"
        cell.productTitle.text = data.title ?? ""
        cell.addToCartButton.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width / 2) - 8, height: 240)
    }
    
}

extension CategoryListViewController: CategoryListCollectionViewCellDelegate {
    func addToCartButtonTapped(sender: UIButton) {
        viewModel.addToCartItem(products[sender.tag])
    }
}
