//
//  CartRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

final class CartRepository : ICartRepository {
    
    private var network: ApiService
    
    init(network: ApiService) {
        self.network = network
    }
    
    func addToCart(_ product: Product, _ completion: @escaping (NetworkConstants.CartItemResponse) -> Void) {
        let cartItem = CartItem(userId: 5, date: "", products: [CartProducts(productId: product.id, quantity: 1)])
        self.network.request(ApiRouter.addToCart(item: cartItem))
        { (result: NetworkConstants.CartItemResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func cartCheckout(_ product: [Product], _ completion: @escaping (NetworkConstants.CartItemResponse) -> Void) {
        

        let cartItem = product.compactMap { item in
            CartItem(userId: 5, date: "", products: [CartProducts(productId: item.id, quantity: 1)])
        }
        
        self.network.request(ApiRouter.checkout(item: cartItem))
        { (result: NetworkConstants.CartItemResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func fetchCart(_ completion: @escaping (NetworkConstants.CartAllResponse) -> Void) {
        self.network.request(ApiRouter.fetchCart)
        { (result: NetworkConstants.CartAllResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
}
