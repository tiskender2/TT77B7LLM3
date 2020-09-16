//
//  CodableInit.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS" 
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        self = try decoder.decode(Self.self, from: data)
    }
}

