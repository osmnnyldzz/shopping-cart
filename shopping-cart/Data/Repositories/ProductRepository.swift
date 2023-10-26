//
//  ProductRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class ProductRepository: IProductRepository {

    private var network: ApiService
    
    init(network: ApiService) {
        self.network = network
    }
    
    func fetchCategories(_ completion: @escaping (NetworkConstants.CategoriesResponse) -> Void) {
        self.network.request(ApiRouter.fetchCategories, completion: { (result: NetworkConstants.CategoriesArrayResponse) in
            switch result {
            case .success(let value):
                let categories = Categories.init(categories: value)
                return completion(.success(categories))
            case .failure(let error):
                return completion(.failure(error))
            }
        })
    }
    
    func fetchAllProducts(_ completion: @escaping (NetworkConstants.ProductResponse) -> Void) {
        self.network.request(ApiRouter.fetchAllProducts) { (result: NetworkConstants.ProductResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func fetchAllSingleCategory(categoryName:String, _ completion: @escaping (NetworkConstants.ProductResponse) -> Void) {
        self.network.request(ApiRouter.fetchSingleCategory(category: categoryName)) { (result: NetworkConstants.ProductResponse) in
            switch result {
            case .success(let value):
                return completion(.success(value))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
}
