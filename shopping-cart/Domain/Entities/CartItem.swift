//
//  CartItem.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

struct CartItem: Codable {
    var userId:Int? = nil
    var date: String? = nil
    var products: [CartProducts]? = nil
}

struct CartProducts: Codable {
    var productId:Int16? = nil
    var quantity:Int? = nil
}

struct CartResponse: Codable {
    var id: Int? = nil
}
