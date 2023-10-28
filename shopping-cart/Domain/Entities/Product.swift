//
//  Product.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

struct Product: Codable {
    var id: Int16? = nil
    var title:String? = nil
    var price: Double? = nil
    var category: String? = nil
    var description: String? = nil
    var image: String? = nil
    var raiting:ProductRaiting? = nil
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case price
        case category
        case description
        case image
        case raiting
    }
}

struct ProductRaiting: Codable {
    var rate: Double? = nil
    var count: Int? = nil
}
