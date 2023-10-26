//
//  IProductRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

protocol IProductRepository {
    typealias CategoriesResponse = Result<Categories, Error>

    func fetchCategories(_ completion: @escaping (CategoriesResponse) -> Void)
}
