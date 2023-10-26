//
//  IAuthUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

protocol IAuthUseCase {
    typealias UserResponse = Result<[User], Error>
    
    func execute(_ completion: @escaping (UserResponse) -> Void)
}
