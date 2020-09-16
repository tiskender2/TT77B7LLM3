//
//  TipsModel.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation


// MARK: - TipsModel
struct TipsModel: Codable,CodableInit {
    var meta: TipsMeta?
    var response: TipsModelResponse?
}

// MARK: - Meta
struct TipsMeta: Codable {
    var code: Int?
    var requestID: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

// MARK: - Response
struct TipsModelResponse: Codable {
    var tips: Tips?
}

// MARK: - Tips
struct Tips: Codable {
    var count: Int?
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var id: String?
    var createdAt: Int?
    var text, type: String?
    var canonicalURL: String?
    var photo: Photo?
    var photourl: String?
    var lang: String?
    var likes: Likes?
    var logView: Bool?
    var agreeCount, disagreeCount: Int?
    var todo: Todo?
    var user: User?
    var source: Source?
    var prefix: String?
    var suffix: String?
    var width, height: Int?
    var checkin: Checkin?
    var visibility: String?
    var defaultCommentPhotoSize:String = "300x200"// url den photoyu cekmek için size gondermek gerekiyor servisten donmediği için kendim default deger ekledim
    enum CodingKeys: String, CodingKey {
        case id, createdAt, text, type
        case canonicalURL = "canonicalUrl"
        case photo, photourl, lang, likes, logView, agreeCount, disagreeCount, todo, user
        case suffix, width, height, checkin, visibility, prefix
    }
}

// MARK: - Likes
struct Likes: Codable {
    var count: Int?
    var groups: [Group]?
    var summary: String?
}
struct Group: Codable {
    var type: String?
    var count: Int?
    var items: [User]?
}

// MARK: - Photo
struct Photo: Codable {
    var id: String?
    var createdAt: Int?
    var source: Source?
    var photoPrefix: String?
    var suffix: String?
    var width, height: Int?
    var visibility: String?
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case photoPrefix = "prefix"
        case suffix, width, height, visibility
    }
}

// MARK: - Source
struct Source: Codable {
    var name: String?
    var url: String?
}

// MARK: - Todo
struct Todo: Codable {
    var count: Int?
}

// MARK: - User
struct User: Codable {
    var id, firstName, lastName: String?
    var photo: UserPhoto?
}

// MARK: - Photo
struct UserPhoto: Codable {
    var prefix: String?
    var suffix: String?
    var defaultUserPhotoSize:String = "100x100"
    enum CodingKeys: String, CodingKey {
        case prefix
        case suffix
    }
}
