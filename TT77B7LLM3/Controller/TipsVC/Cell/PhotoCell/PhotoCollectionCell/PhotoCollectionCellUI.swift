//
//  PhotoCollectionCellUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension PhotoCollectionCell {
    func setUpPhotoCollectionCell() {
        contentView.addSubview(venueImage)
        venueImage.contentMode = .scaleAspectFill
        venueImage.clipsToBounds = true
        venueImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
