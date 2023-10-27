//
//  ViewController.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

import UIKit
import SnapKit

final class HomeVC: UIViewController {
    
    private var viewModel: HomeViewModel!
    private var categories: Categories?
    
    init(viewModel: HomeViewModel) {
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
}

extension HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(collectionView)
        title = "Shopping Cart"

        self.bindData()
        self.setupCollectionView()
        self.setConstraints()
     
    }
    
    private func setupCollectionView(){
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setConstraints() {
        // Base Collection View Constraints
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(self.view.snp.leading).offset(8.0)
            make.trailing.equalTo(self.view.snp.trailing).offset(-8.0)
          
        }
    }
    
    private func bindData() {
        self.viewModel.fetchCategories { response in
            self.categories = response
            self.collectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        return CGSize(width: self.view.frame.width - 16, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CategoryListViewController(viewModel: DIContainer.instance.categoryListViewModel())
        
        self.viewModel.fetchAllSingleCategory(categoryName: self.categories?.categories[indexPath.row] ?? "") { response in
            vc.products = response
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


