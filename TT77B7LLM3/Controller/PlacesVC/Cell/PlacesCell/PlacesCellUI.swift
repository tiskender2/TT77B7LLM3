//
//  PlacesCellUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension PlacesCell {
    
    func setupCell(){
        setupContentStackView()
        contentView.layoutIfNeeded() // contentStackview de yükseklikleri kesin belli olmayan 3 tane label var bunlar içerisindeki yazının uzunluguna gore yukseklikleri değişiyor bazen (3 label de beklenenden daha uzun oldugunda cell'in uzunlugu yanlıs ayarlana biliyor bu hatayı cozmek için bu fonksiyonu kullandım bu fonksiyon layout itemlerini cok hızlı bi şekilde yeniden yuklemeyı saglıyor bu sayede cell yuksekliğini doğru ayarlayabılıyor)
    }
    
    fileprivate func setupContentStackView() {
        let view = UIView()
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 10, view: view)
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        contentStackView.addArrangedSubview(views: [setupLabelsStackView(),setupCountryLabel()])
    }
    fileprivate func setupLabelsStackView() -> UIView {
        let view = UIView()
        labelsStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 10, view: view)
        labelsStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        labelsStackView.addArrangedSubview(views: [setupTitleLabel(),setupLocationStackView()])
        return view
    }
    fileprivate func setupLocationStackView() -> UIView {
        let view = UIView()
        locationStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 0, view: view)
        locationStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        locationStackView.addArrangedSubview(views: [setupAddressLabel(),setupCityLabel()])
        return view
    }
    fileprivate func setupTitleLabel() -> UIView {
        let view = UIView()
        view.addSubview(titleLabel)
       
        titleLabel.text = "Vefakar Cafe"
        titleLabel.font = .robotoMedium17
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .blueWithAHintOfPurple
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupAddressLabel() -> UIView {
        let view = UIView()
        view.addSubview(addressLabel)
        
        addressLabel.numberOfLines = 0 // address uzun olabiliyor cell'i uzatması için 0 yaptım 
        addressLabel.text = "Süleymaniye"
        addressLabel.font = .robotoRegular14
        addressLabel.textColor = .blackTwo
        addressLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupCityLabel() -> UIView {
        let view = UIView()
        view.addSubview(cityLabel)
        
        cityLabel.text = "İstanbul"
        cityLabel.font = .robotoRegular14
        cityLabel.textColor = .blackTwo
        cityLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupCountryLabel() -> UIView {
        let view = UIView()
        view.addSubview(countryLabel)
        view.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(100)
        }
        
        countryLabel.numberOfLines = 0
        countryLabel.text = "Turkey"
        countryLabel.font = .robotoMedium14
        countryLabel.textColor = .greyish
        countryLabel.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal) //country label i sağ tarafa baskılaması için
        countryLabel.snp.makeConstraints { (make) in
            make.bottom.trailing.leading.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
        }
        return view
    }
    
}
