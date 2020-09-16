//
//  PhotoCollectionCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class PhotoCollectionCell: UICollectionViewCell {
    lazy var venueImage = UIImageView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpPhotoCollectionCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(item:Item?){
        let size = "\(item?.width ?? 300)x\(item?.height ?? 300)"
        let image = "\(item?.prefix ?? "")\(size)\(item?.suffix ?? "")"
        setImg(image: venueImage, imgLink: image)
    }
}
