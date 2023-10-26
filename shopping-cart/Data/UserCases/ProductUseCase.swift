//
//  ProductUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class ProductUseCase : IProductUseCase {
  
    private var productRepository : ProductRepository
    

    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func executeCategories(_ completion: @escaping (NetworkConstants.CategoriesResponse) -> Void) {
        self.productRepository.fetchCategories { (response) in
            completion(response)
        }
    }
    
    func executeAllProducts(_ completion: @escaping (NetworkConstants.ProductResponse) -> Void) {
        self.productRepository.fetchAllProducts { (response) in
            completion(response)
        }
    }
    
    func executeSingleCategory(categoryName: String, _ completion: @escaping (NetworkConstants.ProductResponse) -> Void) {
        self.productRepository.fetchAllSingleCategory(categoryName: categoryName) { (response) in
            completion(response)
        }
    }
}

