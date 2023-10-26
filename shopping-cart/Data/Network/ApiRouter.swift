//
//  ApiRouter.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 26.10.2023.
//
import Alamofire

enum ApiRouter: URLRequestConvertible {

    case fetchCategories
    case fetchUser
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.BaseUrl.asURL()
        
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        
        urlRequest.setValue(NetworkConstants.ContentType.formJson.rawValue,
                            forHTTPHeaderField: NetworkConstants.HttpHeaderField.contentType.rawValue)    
        urlRequest.setValue(NetworkConstants.ContentType.json.rawValue,
                            forHTTPHeaderField: NetworkConstants.HttpHeaderField.acceptType.rawValue)
        
        urlRequest.timeoutInterval = 20.0
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    private var path: String {
        switch self {
        case .fetchCategories:
            return "products/categories"
        case .fetchUser:
            return "users"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .fetchCategories:
            return .get
        case .fetchUser:
            return .get
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .fetchCategories:
            return [:]
        case .fetchUser:
            return [:]
        }
    }
}
