//
//  ProductListViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class ProductListViewModel {
    private var productUseCase: ProductUseCase
    private var cartUseCase: CartUseCase
    
    init(productUseCase: ProductUseCase, cartUseCase: CartUseCase) {
        self.productUseCase = productUseCase
        self.cartUseCase = cartUseCase
    }
    
    func addToCartItem(_ product: Product, completion: @escaping (Bool) -> Void) {
        self.cartUseCase.executeAddToCart(product) { response in
            switch response {
            case .success(_):
                DBManager.shared.addToCart(product)
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
}
