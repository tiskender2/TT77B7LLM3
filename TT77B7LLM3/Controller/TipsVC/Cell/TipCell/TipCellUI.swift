//
//  TipCellUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension TipCell {
    
    func setUpCell() {
        setUpContentStackView()
    }
    fileprivate func setUpContentStackView(){
        contenStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 16, view: contentView)
        contenStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
        contenStackView.addArrangedSubview(views: [setUpNameAndDateStackView(),setUpimageAndTipStackView()])
    }
    fileprivate func setUpNameAndDateStackView() -> UIView {
        let view = UIView()
        nameAndDateStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 4, view: view)
        nameAndDateStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        nameAndDateStackView.addArrangedSubview(views: [setUpUserImageView(),setUpNameLabel(),setUpDateLabel()])
        return view
    }
    fileprivate func setUpUserImageView() -> UIView {
        let view = UIView()
        view.addSubview(userImageView)
        userImageView.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        userImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.size.equalTo(40)
        }
        return view
    }
    fileprivate func setUpNameLabel() -> UIView {
        let view = UIView()
        view.addSubview(nameLabel)
        nameLabel.font = .robotoRegular16
        nameLabel.textColor = .black
        
        nameLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setUpDateLabel() -> UIView {
        let view = UIView()
        view.addSubview(dateLabel)
        dateLabel.font = .robotoRegular12
        dateLabel.textColor = .lightGray
        dateLabel.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal) //country label i sağ tarafa baskılaması için
        dateLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setUpimageAndTipStackView() -> UIView {
        let view = UIView()
        imageAndTipStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 16, view: view)
        imageAndTipStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        imageAndTipStackView.addArrangedSubview(views: [setUptipImageView(),setUptipLabel()])
        return view
    }
    fileprivate func setUptipImageView() -> UIImageView {
        tipImageView.contentMode = .scaleAspectFill
        tipImageView.clipsToBounds = true
        tipImageView.layer.cornerRadius = 10
        tipImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
        return tipImageView
    }
    fileprivate func setUptipLabel() -> UIView {
        let view = UIView()
        view.addSubview(tipLabel)
        tipLabel.font = .robotoRegular14
        tipLabel.textColor = .black
        tipLabel.numberOfLines = 0
        tipLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
}
