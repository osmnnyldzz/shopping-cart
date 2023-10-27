//
//  CategoryListViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class CategoryListViewModel {
    private var productUseCase: ProductUseCase
    private var cartUseCase: CartUseCase
    
    init(productUseCase: ProductUseCase, cartUseCase: CartUseCase) {
        self.productUseCase = productUseCase
        self.cartUseCase = cartUseCase
    }
    
    func addToCartItem(_ product: Product) {
        self.cartUseCase.executeAddToCart(product) { response in
            switch response {
            case .success(let value):
                print(value.id)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
