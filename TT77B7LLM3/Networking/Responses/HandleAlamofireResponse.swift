//
//  HandleAlamofireResponse.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//


import Foundation
import Alamofire

protocol HandleAlamofireResponse {
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>)
}

extension HandleAlamofireResponse {
    
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        case .failure(let error):
         //   AlertManager.shared.showAlert(title: NetworkConstant.errorTitle, body: NetworkConstant.errorBody)
            
            // Error handling yapmak için direk network katmanına error alert i ekledim ama foursquare normal apilar da günlük 950 premium apilar da 50 istek sınırı koymus bu sınıra ulastıktan sonra sureklı hata mesajı cıkarıyordu burdan silip her servisin failure kısmına ekledim
            completion?(ServerResponse<T>.failure(error as? LocalizedError))
        case .success(let value):
            do {
                let modules = try T(data: value)
                completion?(ServerResponse<T>.success(modules))
            }catch {
                completion?(ServerResponse<T>.failure(error as? LocalizedError))
                print("\(error)")
            }
        }
    }
    
}
