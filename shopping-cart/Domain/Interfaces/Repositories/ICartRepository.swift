//
//  ICartRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

protocol ICartRepository {
    func addToCartItem(_ product: Product, _ completion: @escaping (NetworkConstants.CartItemResponse) -> Void)
    func fetchCart(_ completion: @escaping (NetworkConstants.CartAllResponse) -> Void)
}
