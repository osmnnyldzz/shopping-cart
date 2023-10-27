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
        let cartVC = CartVC(viewModel: DIContainer.instance.cartViewModel())
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let cartNav = UINavigationController(rootViewController: cartVC)
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        cartNav.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 1)
               
        setViewControllers([homeNav, cartNav], animated: false)
    }
}
