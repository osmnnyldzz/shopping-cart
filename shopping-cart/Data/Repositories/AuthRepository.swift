//
//  AuthRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 25.10.2023.
//

final class AuthRepository: IAuthRepository {
    typealias UserResponse = Result<[User], Error>

    private var network: ApiService
    
    init(network: ApiService) {
        self.network = network
    }
    
    func fetchUsers(_ completion: @escaping (UserResponse) -> Void) {
        self.network.request(ApiRouter.fetchUser, completion: { (result: UserResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        })
    }
    
}
