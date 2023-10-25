//
//  ViewController.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

import UIKit

final class HomeVC: UIViewController {
    
    private var viewModel: HomeViewModel!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}



