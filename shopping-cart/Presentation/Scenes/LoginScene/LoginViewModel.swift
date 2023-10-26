//
//  LoginViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class LoginViewModel {
    
    private var authUseCase: AuthUseCase
    
    init(authUseCase: AuthUseCase) {
        self.authUseCase = authUseCase
    }
    
    func fetchUser() {
        self.authUseCase.execute { (response) in
            switch response {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
          
        }
    }
    
}
