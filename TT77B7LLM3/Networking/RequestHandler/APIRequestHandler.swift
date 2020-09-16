//
//  APIRequestHandler.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import Alamofire

typealias CallResponse<T> = ((ServerResponse<T>) -> ())?

protocol APIRequestHandler: HandleAlamofireResponse {
    
}

extension APIRequestHandler where Self: URLRequestBuilder {
    func execute<T: CodableInit> (_ decoder: T.Type, data: UploadData? = nil, progress: ((Progress) ->Void)? = nil, completion: CallResponse<T>) {
        
        request(self).validate().responseData { (response) in
            networkLogger(response:response,params:self.parameters ?? Parameters())
            
            if let data = response.result.value {
                let dataString = String(data: data, encoding: String.Encoding.utf8)!
                print(dataString)
            }
            self.handleResponse(response, completion: completion)
        }
    }
}
fileprivate func networkLogger(response:DataResponse<Data>,params:Parameters){
    print("✅✅✅✅✅✅\n SUCCESS\n[\(String(describing: response.request?.httpMethod)) \(String(describing: response.response?.statusCode))]\nURL: \n\(String(describing: response.request?.url?.absoluteString))\nHeader: \n\(response.request?.allHTTPHeaderFields ?? [:]) \nBody: \n\(params)\nResponse: (\(String(describing: response.request?.url?.absoluteString)))\n\(response.data?.prettyPrintedJSONString ?? "")\n\n✅✅✅✅✅✅") // foursquare api response ları sitesindeki gosterdiklerinden farklı verıler donebılıyor bu da model uyusmazlıgına sebeb oluyor bunu daha hızlı fark etmek için boyle bir extension yazdım
}
