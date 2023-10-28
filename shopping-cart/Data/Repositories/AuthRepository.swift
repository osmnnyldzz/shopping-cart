//
//  AuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

final class AuthRepository: IAuthRepository {

    private var network: ApiService
    
    init(network: ApiService) {
        self.network = network
    }
    
    func login(_ username: String, _ password: String, _ completion: @escaping (NetworkConstants.UserResponse) -> Void) {
        self.network.request(ApiRouter.login(username: username, password: password), completion: { (result: NetworkConstants.UserResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        })
    }
    
}
