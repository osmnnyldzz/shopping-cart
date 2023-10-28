//
//  ICartUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 27.10.2023.
//

protocol ICartUseCase {
    func executeAddToCart(_ product: Product, _ completion: @escaping (NetworkConstants.CartItemResponse) -> Void)
    func executeCartCheckout(_ product: [Product], _ completion: @escaping (NetworkConstants.CartItemResponse) -> Void)
    func executeFetchCart(_ completion: @escaping (NetworkConstants.CartAllResponse) -> Void)

}

