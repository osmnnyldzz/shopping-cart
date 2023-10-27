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
    
    func fetchCart(_ completion: @escaping ([CartItem]) -> Void) {
        self.cartUseCase.executeFetchCart { response in
            switch response {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
