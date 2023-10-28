//
//  ApiRouter.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//
import Alamofire

enum ApiRouter: URLRequestConvertible {

    case fetchCategories
    case login(username:String, password:String)
    case fetchAllProducts
    case fetchSingleCategory(category:String)
    case addToCart(item:CartItem)
    case fetchCart
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.BaseUrl.asURL()
        
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        
        urlRequest.setValue(NetworkConstants.ContentType.formJson.rawValue,
                            forHTTPHeaderField: NetworkConstants.HttpHeaderField.contentType.rawValue)    
        urlRequest.setValue(NetworkConstants.ContentType.json.rawValue,
                            forHTTPHeaderField: NetworkConstants.HttpHeaderField.acceptType.rawValue)
        
        if !parameters.isEmpty {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters as AnyObject)
            urlRequest.httpBody = jsonData
        }
        
        urlRequest.timeoutInterval = 20.0
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    private var path: String {
        switch self {
        case .fetchCategories:
            return "products/categories"
        case .fetchSingleCategory(let category):
            return "products/category/\(category)"
        case .login:
            return "auth/login"
        case .fetchAllProducts:
            return "products"
        case .addToCart:
            return "carts"
        case .fetchCart:
            return "carts/user/2"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .fetchCategories:
            return .get
        case .fetchSingleCategory:
            return .get
        case .login:
            return .post
        case .fetchAllProducts:
            return .get
        case .addToCart:
            return .post
        case .fetchCart:
            return .get
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .fetchCategories:
            return [:]
        case .fetchSingleCategory:
            return [:]
        case .login(let username, let password):
            return ["username":username, "password": password]
        case .fetchAllProducts:
            return [:]
        case .addToCart(let item):
            return [
                "userId": item.userId ?? -1,
                "products": [
                    ["productId":5],
                    ["quantity":1]
                ]
            ]
        case .fetchCart:
            return [:]
        }
    }
}
