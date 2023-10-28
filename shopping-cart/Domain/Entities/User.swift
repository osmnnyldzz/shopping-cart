//
//  User.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

struct User: Codable {
    var id: Int? = -1
    var email: String? = ""
    var username: String? = ""
    var password: String? = ""
    var name: UserName? = nil
    var address: UserAddress? = nil
    var phone: String? = ""
    
    enum CodingKeys: CodingKey {
        case id
        case email
        case username
        case password
        case name
        case address
        case phone
    }
}

struct UserName:Codable {
    var firstname: String? = ""
    var lastname: String? = ""
    
    enum CodingKeys: CodingKey {
        case firstname
        case lastname
    }
}

struct UserAddress:Codable {
    var city: String? = ""
    
    enum CodingKeys: CodingKey {
        case city
    }
}

struct LoginResponse : Codable {
    var token:String? = ""
}
