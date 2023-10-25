//
//  User.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

struct User {
    var id: Int? = -1
    var email: String? = ""
    var username: String? = ""
    var password: String? = ""
    var name: UserName? = nil
    var address: UserAddress? = nil
    var phone: String? = ""
}

struct UserName {
    var firstname: String? = ""
    var lastname: String? = ""
}

struct UserAddress {
    var city: String? = ""
}
