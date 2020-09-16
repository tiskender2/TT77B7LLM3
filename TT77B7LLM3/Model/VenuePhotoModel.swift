//
//  VenuePhotoModel2.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
struct VenuePhotoModel: Codable, CodableInit {
    var meta: PhotoMeta?
    var response: PhotoResponse?
}

// MARK: - Meta
struct PhotoMeta: Codable {
    var code: Int?
    var requestID: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

// MARK: - Response
struct PhotoResponse: Codable {
    var photos: Photos?
}

// MARK: - Photos
struct Photos: Codable {
    var count: Int?
    var items: [Item]?
    var dupesRemoved: Int?
}



// MARK: - Checkin
struct Checkin: Codable {
    var id: String?
    var createdAt: Int?
    var type: String?
    var timeZoneOffset: Int?
}



