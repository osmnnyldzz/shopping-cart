//
//  IProductUseCase.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

protocol IProductUseCase {
    func executeCategories(_ completion: @escaping (NetworkConstants.CategoriesResponse) -> Void)
    func executeAllProducts(_ completion: @escaping (NetworkConstants.ProductResponse) -> Void)
    func executeSingleCategory(categoryName:String, _ completion: @escaping (NetworkConstants.ProductResponse) -> Void)
}
