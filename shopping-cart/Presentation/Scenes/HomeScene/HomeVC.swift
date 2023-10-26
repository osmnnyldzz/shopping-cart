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
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
}

extension HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        self.setupCollectionView()
        self.setConstraints()
     
    }
    
    private func setupCollectionView(){
        self.collectionView.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryListCollectionViewCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setConstraints() {
        // Base Collection View Constraints
        self.collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.0)
            make.bottom.equalToSuperview().offset(-8.0)
            make.leading.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().offset(-8.0)
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryListCollectionViewCell", for: indexPath) as! CategoryListCollectionViewCell
        
        cell.backgroundColor = .orange
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 16, height: 100)
    }
}


#Preview {
    HomeVC(viewModel: DIContainer.instance.homeViewModel())
}

