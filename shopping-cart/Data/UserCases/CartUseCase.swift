//
//  CartUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

final class CartUseCase: ICartUseCase {
    private var cartRepository : CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func executeAddToCart(_ product: Product,_ completion: @escaping (NetworkConstants.CartItemResponse) -> Void) {
        self.cartRepository.addToCartItem(product) { (response) in
            completion(response)
        }
    }
    
    func executeFetchCart(_ completion: @escaping (NetworkConstants.CartAllResponse) -> Void){
        self.cartRepository.fetchCart() { (response) in
            completion(response)
        }
    }
}
