//
//  IProductRepository.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

protocol IProductRepository {
    func fetchCategories(_ completion: @escaping (NetworkConstants.CategoriesResponse) -> Void)
    func fetchAllProducts(_ completion: @escaping (NetworkConstants.ProductResponse) -> Void)
    func fetchAllSingleCategory(categoryName:String, _ completion: @escaping (NetworkConstants.ProductResponse) -> Void)
}
