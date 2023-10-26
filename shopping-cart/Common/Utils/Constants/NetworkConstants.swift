//
//  NetworkConstants.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

struct NetworkConstants {
    static var BaseUrl = "https://fakestoreapi.com/"
    
    enum HttpHeaderField: String {
        case contentType = "Content-Type"
        case acceptType = "Accept"
    }
    
    enum ContentType: String {
        case formJson = "application/x-www-form-urlencoded"
        case json = "application/json"
    }

}
