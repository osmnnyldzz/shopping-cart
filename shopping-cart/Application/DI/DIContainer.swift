//
//  DIContainer.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

class DIContainer {
    
    static var instance = DIContainer()
    
    private init() { }
    
    var apiService = ApiService()
    
    func createAuthRepository() -> AuthRepository {
        return AuthRepository(network: self.apiService)
    }
    
    func createAuthUseCase() -> AuthUseCase {
        return AuthUseCase(authRepository: createAuthRepository())
    }
    
    func authViewModel() -> LoginViewModel {
        return LoginViewModel(authUseCase: createAuthUseCase())
    }
    
    func homeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }
    
}
