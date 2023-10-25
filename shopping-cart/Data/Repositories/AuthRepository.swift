//
//  AuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

final class AuthRepository: IAuthRepository {
    
    private weak var network: ApiService?
    
    init(network: ApiService) {
        self.network = network
    }
    
    func fetchUsers() -> User? {
        return network?.fetchUser()
    }
    
}
