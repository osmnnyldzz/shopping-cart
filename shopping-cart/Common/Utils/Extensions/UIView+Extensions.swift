//
//  UIView+Extensions.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import UIKit

extension UIView {
    
    func addBorder(width:CGFloat = 1, color: UIColor = .systemGray5, radius: CGFloat = 4) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
    }
    
}
