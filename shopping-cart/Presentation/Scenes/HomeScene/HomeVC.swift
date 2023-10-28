//
//  ViewController.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

import UIKit
import SnapKit

final class HomeVC: UIViewController {
    
    private var viewModel: HomeViewModel?
    private var homeView = UIHomeView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}

extension HomeVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping Cart"
        
        homeView.delegate = self
        view = homeView
        
        self.bindData()
    }
    
    private func bindData() {
        self.viewModel?.fetchCategories { [weak self] response in
            guard let self = self else { return }
            self.homeView.categories = response
            self.homeView.collectionView.reloadData()
        }
    }
}

extension HomeVC: UIHomeViewDelegate {
    func categoryTapped(categoryName:String) {
        let vc = ProductListVC(viewModel: DIContainer.instance.categoryListViewModel())
        
        self.viewModel?.fetchAllSingleCategory(categoryName: categoryName) { [weak self] response in
            guard let self = self else { return }
            vc.products = response
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


