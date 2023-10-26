//
//  ProductRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class ProductRepository: IProductRepository {
    typealias CategoriesResponse = Result<Categories, Error>

    private var network: ApiService
    
    init(network: ApiService) {
        self.network = network
    }
    
    func fetchCategories(_ completion: @escaping (CategoriesResponse) -> Void) {
        self.network.request(ApiRouter.fetchCategories, completion: { (result: Result<[String], Error>) in
            switch result {
            case .success(let value):
                let categories = Categories.init(categories: value)
                return completion(.success(categories))
            case .failure(let error):
                return completion(.failure(error))
            }
        })
    }
}
