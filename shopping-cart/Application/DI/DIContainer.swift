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
    
    // Login Scene Prepare
    func createAuthRepository() -> AuthRepository {
        return AuthRepository(network: self.apiService)
    }
    
    func createAuthUseCase() -> AuthUseCase {
        return AuthUseCase(authRepository: createAuthRepository())
    }
    
    func authViewModel() -> LoginViewModel {
        return LoginViewModel(authUseCase: createAuthUseCase())
    }
    
    // Home Scene Prepare
    func createProductRepository() -> ProductRepository {
        return ProductRepository(network: self.apiService)
    }
    
    func createProductUseCase() -> ProductUseCase {
        return ProductUseCase(productRepository: createProductRepository())
    }

    func homeViewModel() -> HomeViewModel {
        return HomeViewModel(productUseCase: createProductUseCase())
    }

    // CategoryList Scene Prepare
    func categoryListViewModel() -> CategoryListViewModel {
        return CategoryListViewModel(productUseCase: createProductUseCase())
    }
}
