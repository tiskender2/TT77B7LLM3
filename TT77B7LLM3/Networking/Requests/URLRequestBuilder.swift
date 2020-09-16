//
//  URLRequestBuilder.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation
import Alamofire


protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    var path: String { get }
    
    var parameters: Parameters? { get }
    var headers: HTTPHeaders { get }
    
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
   
}

extension URLRequestBuilder {
    
    var mainURL: URL {
        return URL(string:  NetworkConstant.baseURL)!
    }
    
    var requestURL: URL {
        print(mainURL.appendingPathComponent(path))
        return mainURL.appendingPathComponent(path)
    }
    
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach{ request.addValue($1, forHTTPHeaderField: $0) }
        print(request)
        return request
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        let header = HTTPHeaders()
        
       // header["client_id"] = client_id
       // header["client_secret"] = client_secret
        
        print(header)
        return header
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
