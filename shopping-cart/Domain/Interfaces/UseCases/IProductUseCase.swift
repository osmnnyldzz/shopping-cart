//
//  IProductUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

protocol IProductUseCase {
    typealias CategoriesResponse = Result<Categories, Error>

    func executeCategories(_ completion: @escaping (CategoriesResponse) -> Void)
}
