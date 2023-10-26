//
//  IAuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

protocol IAuthRepository {
    typealias UserResponse = Result<[User], Error>
    
    func fetchUsers(_ completion: @escaping (UserResponse) -> Void)
}
