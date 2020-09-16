//
//  VenueAPI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation
import Alamofire

enum VenueAPI: URLRequestBuilder {
   
    case search(ll:String, near: String, query:String)
    case tips(venueID:String,sort:String, limit: String, offset:String)
    case photos(venueID:String,group:String, limit: String, offset:String)
   
    internal var apiPath: String {
        return "venues/"
    }
    
    internal var methodPath: String {
        switch self {
        case .search:
            return "search"
        case .tips(venueID: let venueID, sort: _, limit: _, offset: _):
            return "\(venueID)/tips"
        case .photos(venueID: let venueID, group: _, limit: _, offset: _):
            return "\(venueID)/photos"
        }
    }
    internal var path: String {
        return "\(apiPath)\(methodPath)"
    }
    
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
       
        case .search(let ll, let near,let query):
            params["client_id"] = NetworkConstant.client_id
            params["client_secret"] = NetworkConstant.client_secret
            params["query"] = query
            params["v"] = NetworkConstant.versionNumber
            if near != "" {
                params["near"] = near
            } else {
                params["ll"] = ll
            }
        case .tips(venueID: _, sort: let sort, limit: let limit, offset: let offset):
            params["client_id"] = NetworkConstant.client_id
            params["client_secret"] = NetworkConstant.client_secret
            params["v"] = NetworkConstant.versionNumber
            params["sort"] = sort
            params["limit"] = limit
            params["offset"] = offset
            
        case .photos(venueID: _, group: let group, limit: let limit, offset: let offset):
            params["client_id"] = NetworkConstant.client_id
            params["client_secret"] = NetworkConstant.client_secret
            params["v"] = NetworkConstant.versionNumber
            params["group"] = group
            params["limit"] = limit
            params["offset"] = offset
        }
        
        return params
    }

    
    internal var method: HTTPMethod {
        switch self {
        case .search, .tips, .photos:
            return .get
        }
    }
    
}
