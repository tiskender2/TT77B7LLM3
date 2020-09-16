//
//  UploadData.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation

struct UploadData: Codable, CodableInit {
    var data: Data?
    var uploadPath: String?
    var fileName, mimeType, name: String?
}
