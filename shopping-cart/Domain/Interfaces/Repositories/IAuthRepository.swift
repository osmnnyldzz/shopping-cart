//
//  IAuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

protocol IAuthRepository {
    func login(_ username: String, _ password: String, _ completion: @escaping (NetworkConstants.UserResponse) -> Void)
}
