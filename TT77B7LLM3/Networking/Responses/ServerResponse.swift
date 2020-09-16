//
//  ServerResponse.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation

enum ServerResponse<T> {
    case success(T), failure(LocalizedError?)
}
