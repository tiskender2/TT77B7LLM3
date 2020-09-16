//
//  TipsVM.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation

struct Params{
    var venueID: String?
    var sort: String? = "popular"
    var limit: String? = "100"
    var offset: String? = "100"
    var group: String? = "venue"
}
protocol TipsVMDelegate: class {
    func fetchTips()
    func fetchPhotos()
}

class TipsVM {
    static let shared = TipsVM()
    var params = Params()
    weak var delegate:TipsVMDelegate?
    var tips: Tips?
    var photos: Photos?
    var sections:[TipVCSections]?
    var noComment = false
    var noVenueImage = false
    func getPhotosItem() -> [Item]? {
        return photos?.items
    }
    func getTipsCount() -> Int {
        if tips?.items?.count == 0  || tips?.items == nil { // tip section da veri olmadan reload etmeye calısınca crash oluyor o  yuzden defaul 1 dondurdum
            return 1
        }
        return tips?.items?.count ?? 0
    }
    func getTipItem(indexPath:IndexPath) -> Item? {
        return tips?.items?[indexPath.row]
    }
    
    func setParams(params:Params){
        self.params = params
        sections = [.map,.loading,.loading] // ilk TipVC acıldıgında servisten veriler gelene kadar indicator gostermek için boyle bir array yaptım
        noComment = false// initial deger
        noVenueImage = false// initial deger
    }
}
extension TipsVM {
    func fetchTips() {
        VenueAPI.tips(venueID: params.venueID ?? "", sort: params.sort ?? "", limit: params.limit ?? "", offset: params.offset ?? "").execute(TipsModel.self) { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .success(let data):
                if data.meta?.code == 200 {
                    self.tips = data.response?.tips
                    if self.tips?.items?.count ?? 0 > 0 {
                        self.noComment = false
                        self.sections?[TipVCSections.tips.rawValue] = .tips
                    } else {
                        self.noComment = true
                    }
                    self.delegate?.fetchTips()
                } else {
                    AlertManager.shared.showAlert(title: NetworkConstant.errorTitle, body: NetworkConstant.errorBody)
                }
            case .failure(let err):
                print(err?.localizedDescription ?? "")
                self.delegate?.fetchTips()
            }
        }
    }
    func fetchPhotos() {
        VenueAPI.photos(venueID: params.venueID ?? "", group: params.group ?? "", limit: params.limit ?? "", offset: params.offset ?? "").execute(VenuePhotoModel.self) { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .success(let data):
                if data.meta?.code == 200 {
                    self.photos = data.response?.photos
                    if self.photos?.items?.count ?? 0 > 0 {
                        self.noVenueImage = false
                         self.sections?[TipVCSections.photo.rawValue] = .photo
                    } else {
                        self.noVenueImage = true
                    }
                    
                    self.delegate?.fetchPhotos()
                } else {
                    AlertManager.shared.showAlert(title: NetworkConstant.errorTitle, body: NetworkConstant.errorBody)
                }
            case .failure(let err):
                print(err?.localizedDescription ?? "")
                self.delegate?.fetchPhotos()
            }
        }
    }
}
