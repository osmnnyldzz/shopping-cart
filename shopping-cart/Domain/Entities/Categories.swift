//
//  Categories.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

import UIKit

struct Categories : Codable {
    var categories: [String]
    
    var categoryImage: [UIImage] {
       return [
        .electronics,
        .womensClothing,
        .mensClothing,
        .jewelery
       ]
    }
}
