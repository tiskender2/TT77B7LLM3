//
//  PlacesVM.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
protocol PlacesVMDelegate: class {
    func getVenues()
}
class PlacesVM {
    static let shared = PlacesVM()
    weak var delegate:PlacesVMDelegate?
    var venuesArray:Response?
    
    var section:RowsEnum = .loading {
        didSet {
            showErrorMessage = false // initial değeri
        }
    }
    var showErrorMessage: Bool = false
    
    var ll:String?
    var near:String?
    var query:String?
    
    func getVenuesCount() -> Int {
        return venuesArray?.venues?.count ?? -1
    }
    func getVenue(indexPath:IndexPath) -> Venue? {
        return venuesArray?.venues?[indexPath.row]
    }
    func showEmptyLabel(){
        showErrorMessage = true
    }
    
}
extension PlacesVM {
    func fetchVenues() {
        VenueAPI.search(ll: ll ?? "", near: near ?? "",query: query ?? "").execute(VenueModel.self) { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .success(let data):
                if data.meta?.code == 200 {
                    self.venuesArray = data.response
                    
                    if data.response?.venues?.count ?? 0 >  0 {
                        self.section = .venues
                    } else {
                        self.section = .loading
                    }
                    
                    self.delegate?.getVenues()
                } else {
                    AlertManager.shared.showAlert(title: NetworkConstant.errorTitle, body: NetworkConstant.errorBody)
                }
            case .failure(let err):
                print(err?.localizedDescription ?? "")
                self.showEmptyLabel()
                self.delegate?.getVenues()
            }
        }
    }
 
}
