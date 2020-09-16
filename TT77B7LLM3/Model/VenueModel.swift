//
//  VenueModel.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//
import Foundation

// MARK: - CompetitionModel
struct VenueModel: Codable,CodableInit {
    var meta: Meta?
    var response: Response?
}

// MARK: - Meta
struct Meta: Codable {
    var code: Int?
    var requestID: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

// MARK: - Response
struct Response: Codable {
    var venues: [Venue]?
    var confident: Bool?
    var geocode: Geocode?
}

// MARK: - Geocode
struct Geocode: Codable {
    var what, geocodeWhere: String?
    var feature: Feature?
    
    enum CodingKeys: String, CodingKey {
        case what
        case geocodeWhere = "where"
        case feature
    }
}

// MARK: - Feature
struct Feature: Codable {
    var cc: String?
    var name, displayName, matchedName, highlightedName: String?
    var woeType: Int?
    var slug, id, longID: String?
    var geometry: Geometry?
    
    enum CodingKeys: String, CodingKey {
        case cc, name, displayName, matchedName, highlightedName, woeType, slug, id
        case longID = "longId"
        case geometry
    }
}



// MARK: - Geometry
struct Geometry: Codable {
    var center: Center?
    var bounds: Bounds?
}

// MARK: - Bounds
struct Bounds: Codable {
    var ne, sw: Center?
}

// MARK: - Center
struct Center: Codable {
    var lat, lng: Double?
}

// MARK: - Venue
struct Venue: Codable {
    var id, name: String?
    var location: Location?
    var categories: [Category]?
    var referralID: String?
    var hasPerk: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, categories
        case referralID = "referralId"
        case hasPerk
    }
}

// MARK: - Category
struct Category: Codable {
    var id, name, pluralName, shortName: String?
    var icon: Icon?
    var primary: Bool?
}

// MARK: - Icon
struct Icon: Codable {
    var iconPrefix: String?
    var suffix: String?
    
    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

// MARK: - Location
struct Location: Codable {
    var lat, lng: Double?
    var labeledLatLngs: [LabeledLatLng]?
    var distance: Int?
    var cc: String?
    var country: String?
    var formattedAddress: [String]?
    var address, city, crossStreet, postalCode: String?
    var state: String?
}


// MARK: - LabeledLatLng
struct LabeledLatLng: Codable {
    var label: String?
    var lat, lng: Double?
}

