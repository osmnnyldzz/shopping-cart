//
//  CartViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

final class CartViewModel {
    
    private var cartUseCase: CartUseCase
    var onUpdate: () -> Void = {}
    
    init(cartUseCase: CartUseCase) {
        self.cartUseCase = cartUseCase
    }
    
    func checkout(_ product:Product, completion: @escaping (Bool) -> Void) {
        self.cartUseCase.executeCartCheckout(product) { response in
            switch response {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
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
    
    func deleteCart() {
        DBManager.shared.deleteCart { process in
            self.onUpdate()
        }
    }
    
    func logout(_ completion: @escaping () -> Void) {
        Global.isUserLogin = nil
        completion()
    }
}
