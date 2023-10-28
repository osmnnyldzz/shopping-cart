//
//  UIController+Extensions.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit

extension UIAlertController {
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
    }
}
