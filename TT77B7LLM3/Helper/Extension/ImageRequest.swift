//
//  ImageRequest.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import Kingfisher

func setImg(image: UIImageView?, imgLink: String) -> (){
    let url = URL(string: imgLink)
    
    image!.kf.indicatorType = .activity
    image!.kf.setImage(
        with: url,
        placeholder: nil,
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
    ])
}
func setUserPhotoImg(image: UIImageView?, imgLink: String) -> (){
    let url = URL(string: imgLink)
    
    image!.kf.indicatorType = .activity
    image!.kf.setImage(
        with: url,
        placeholder: UIImage(named: "dummyUserProfile"),
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
    ])
}
