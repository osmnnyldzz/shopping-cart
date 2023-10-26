//
//  ImageEnum.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

import UIKit

enum ImageEnum {
    case electronics
    case jewelery
    case mensClothing
    case womensClothing
    
    var image: UIImage {
        switch self {
        case .electronics:   return UIImage(named: "electronics") ?? .init()
        case .jewelery:      return UIImage(named: "jewelery") ?? .init()
        case .mensClothing:  return UIImage(named: "mensClothing") ?? .init()
        case .womensClothing:return UIImage(named: "womensClothing") ?? .init()
        }
    }
}
