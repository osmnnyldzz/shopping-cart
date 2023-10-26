//
//  HomeViewModel.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//

final class HomeViewModel {
    
    var categories = ["Test","Test","Test"]
    
    private var productUseCase: ProductUseCase
    
    init(productUseCase: ProductUseCase) {
        self.productUseCase = productUseCase
    }
    
    func fetchCategories(_ completionHandler: @escaping (Categories) -> Void ) {
        self.productUseCase.executeCategories { (response) in
            switch response {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
