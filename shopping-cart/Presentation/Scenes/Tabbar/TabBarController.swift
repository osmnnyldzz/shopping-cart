//
//  TabBarController.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeVC(viewModel: DIContainer.instance.homeViewModel())
        let secondVC = CategoryListViewController(viewModel: DIContainer.instance.categoryListViewModel()) // Dummy
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let secondNav = UINavigationController(rootViewController: secondVC) // Dummy
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        secondNav.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "2.circle"), tag: 1)
               
        setViewControllers([homeNav, secondNav], animated: false) 
    }
}
