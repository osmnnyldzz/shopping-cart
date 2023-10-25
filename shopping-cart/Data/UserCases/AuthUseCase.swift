//
//  AuthUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

final class AuthUseCase : IAuthUseCase {
    
    private var authRepository : AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute() -> User? {
        return authRepository.fetchUsers()
    }
    
}
