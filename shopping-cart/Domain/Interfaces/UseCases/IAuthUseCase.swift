//
//  IAuthUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

protocol IAuthUseCase {
    
    func execute(_ username: String, _ password: String,_ completion: @escaping (NetworkConstants.UserResponse) -> Void)
}
