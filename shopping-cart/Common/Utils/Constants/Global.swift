//
//  Global.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import Foundation

struct Global {
    private static let userDefaults = UserDefaults.standard
    private static let tokenKey = "AuthTokenKey"
    
    static var isUserLogin:String? {
        get {
            return userDefaults.string(forKey: tokenKey)
        }
        set {
            return userDefaults.set(newValue,forKey: tokenKey)
        }
    }
    
}
