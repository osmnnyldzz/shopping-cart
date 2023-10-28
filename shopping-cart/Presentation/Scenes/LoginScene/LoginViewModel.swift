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
    
    func login(_ username:String, _ password:String,_ completion: @escaping () -> Void) {
        self.authUseCase.execute(username, password) { (response) in
            switch response {
            case .success(let value):
                if let token = value.token {
                    Global.isUserLogin = token
                    completion()
                }
            case .failure(let error):
                print(error)
            }
          
        }
    }
    
}
