//
//  IAuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

protocol IAuthRepository {
    func fetchUsers() -> User?
}
