//
//  AuthUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

final class AuthUseCase : IAuthUseCase {
    private var authRepository : AuthRepository
    
    typealias UserResponse = Result<[User], Error>
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(_ completion: @escaping (UserResponse) -> Void) {
        self.authRepository.fetchUsers { (response) in
            completion(response)
        }
    }
}
