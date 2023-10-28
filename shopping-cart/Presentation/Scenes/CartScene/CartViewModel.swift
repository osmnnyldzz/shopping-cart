//
//  CartViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

final class CartViewModel {
    
    private var cartUseCase: CartUseCase
    
    init(cartUseCase: CartUseCase) {
        self.cartUseCase = cartUseCase
    }
    
    func fetchCart(_ completion: @escaping ([Product]) -> Void) {
        self.cartUseCase.executeFetchCart { response in
            switch response {
            case .success(_):
                completion(DBManager.shared.fetchCart())
            case .failure(let error):
                print(error)
            }
        }
    }
}
