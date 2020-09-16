//
//  HomeUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 11.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension HomeVC {
    
    func setUI(){
        view.backgroundColor = .silver
        navigationItem.title = "Main Page"
        LocationManager.shared.checkLocationPerm()
        setUpStackView()
    }
    
    fileprivate func setUpStackView() {
        let contentView = UIView()
        stackView.setupStackView(alignment: .fill, distribution: .fillEqually, axis: .vertical, spacing: 26, view: contentView)
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(27) //26pt 35 px'e denk geliyor. safeArea degeri de 8 o yuzden 27 yaptım
        }
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stackView.addArrangedSubview(views: [setUpPlaceTextField(),setUpCityTextField(),setUpSearchButton()])
    }
    
    fileprivate func setUpPlaceTextField() -> UIView {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        placeTextField.placeholder = "Exp. Cafe, Bar"
        placeTextField.borderStyle = .none
        placeTextField.keyboardType = .default
        placeTextField.returnKeyType = .done
        placeTextField.font = .robotoRegular16
        placeTextField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        placeTextField.isJustLetter = true
        contentView.addSubview(placeTextField)
        placeTextField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        return contentView
    }
    
    fileprivate func setUpCityTextField() -> UIView {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        cityTextFiled.placeholder = "Close to me"
        cityTextFiled.borderStyle = .none
        cityTextFiled.keyboardType = .default
        cityTextFiled.returnKeyType = .done
        cityTextFiled.font = .robotoRegular16
        cityTextFiled.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(cityTextFiled)
        cityTextFiled.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        return contentView
    }
    
    fileprivate func setUpSearchButton() -> UIView {
        let contentView = UIView()
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .blurple
        contentView.addSubview(setUpSearchIcon())
        contentView.addSubview(setUpButton())
        
        setUpButton().snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        setUpSearchIcon().snp.makeConstraints { (make) in
            make.size.equalTo(25)
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        return contentView
    }
  
    fileprivate func setUpButton() -> UIButton {
        searchButton.setTitle("Search", for: .normal)
        searchButton.titleLabel?.font = .robotoMedium18
        searchButton.tintColor = .white
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return searchButton
    }
    fileprivate func setUpSearchIcon() -> UIImageView {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "search")
        return imageView
    }
   
}
//MARK:- ACTION
extension HomeVC {
    @objc func searchButtonAction(sender: UIButton!) {
        guard placeTextField.text != "" else {
            AlertManager.shared.showAlert(title: "UYARI", body: "Lütfen bir mekan giriniz.")
            return
        }
        pushtoPlacesVC()
    }
    fileprivate func pushtoPlacesVC(){
        viewModel.query = placeTextField.text
        viewModel.near = cityTextFiled.text
        viewModel.section = .loading
        let vc = PlacesVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
