//
//  NetworkConstant.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation

class NetworkConstant {
    
    static var baseURL: String {
        return  "https://api.foursquare.com/v2/"
    }
    static var client_id: String {
        return "2IRX5QSGJFNOFPXAY2NHT5B45WTCVAEBPDR3ZWL45C1JVLZP"
    }
    static var client_secret: String {
        return "L11SW1PEY4SLL3PWOLCWOKVPPUBIEP01OGQFNQ4V01MCMSIR"
    }
    static var versionNumber: String {
        return "20200101" // userless Auth servisi için versiyon numarası eklenmesi gerekiyor 2013 yılından buyuk herhangi bir yıl olabilir
    }
    static var errorTitle: String {
        return "HATA!"
    }
    static var errorBody: String {
        return "Bir hata ile karşılaştık lütfen sonra tekrar deneyiniz."
    }
}
