//
//  PhotoCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: BaseCell {
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    lazy var contentStackView = UIStackView()
    lazy var venueNameLabel = UILabel()
    var photos:[Item]?
    var st:String = ""
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(venue:Venue?,photos:[Item]?){
        venueNameLabel.text = venue?.name
        self.photos = photos
        collectionView.reloadData()
    }
}
