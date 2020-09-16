//
//  PhotoCellUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

extension PhotoCell {
     
    func setupCollectionCell(){
        setUpContenStackView()
    }
    fileprivate func setUpContenStackView(){
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 0, view: contentView)
        contentStackView.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.edges.equalToSuperview()
        }
        contentStackView.addArrangedSubview(views: [setUpCollectionView(),setUpVenueNameLabel()])
    }
    fileprivate func setUpCollectionView() -> UICollectionView {
        let layout:UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: "PhotoCollectionCell")
        collectionView.backgroundColor = .silver
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(255)
        }
        return collectionView
    }
    fileprivate func setUpVenueNameLabel() -> UILabel {
        venueNameLabel.font = .robotoMedium17
        venueNameLabel.numberOfLines = 2
        venueNameLabel.textColor = .black
        venueNameLabel.textAlignment = .center
        return venueNameLabel
    }
}
// MARK: UICollectionViewDelegate
extension PhotoCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath) as! PhotoCollectionCell
        //cell.setCell(item: photos?.items?[indexPath.row])
        //cell.setPhoto(image: st)
        cell.setCell(item: photos?[indexPath.row])
        return cell
    }
}
// MARK: UICollectionViewDelegate
extension PhotoCell: UICollectionViewDelegate {
    
}
// MARK: UICollectionViewDelegateFlowLayout
extension PhotoCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
}
