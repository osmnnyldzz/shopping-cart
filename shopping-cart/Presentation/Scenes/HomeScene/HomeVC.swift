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
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
}

extension HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(collectionView)
        

        self.bindData()
        self.setupCollectionView()
        self.setConstraints()
     
    }
    
    private func setupCollectionView(){
        self.collectionView.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: CategoryListCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setConstraints() {
        // Base Collection View Constraints
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8.0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8.0)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCollectionViewCell.identifier, for: indexPath) as! CategoryListCollectionViewCell
        
        cell.backgroundColor = .orange
        cell.categoryTitleLabel.text = self.categories?.categories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


//#Preview {
//HomeVC(viewModel: DIContainer.instance.homeViewModel())
//}

