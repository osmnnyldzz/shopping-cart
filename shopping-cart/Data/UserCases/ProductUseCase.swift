//
//  ProductUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class ProductUseCase : IProductUseCase {
    private var productRepository : ProductRepository
    
    typealias CategoriesResponse = Result<Categories, Error>

    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func executeCategories(_ completion: @escaping (CategoriesResponse) -> Void) {
        self.productRepository.fetchCategories { (response) in
            completion(response)
        }
    }
}

