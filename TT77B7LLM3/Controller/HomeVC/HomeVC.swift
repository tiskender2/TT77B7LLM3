//
//  HomeVC.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 11.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class HomeVC: BaseVC {
    lazy var placeTextField = CommonTextField()
    lazy var cityTextFiled = CommonTextField()
    lazy var searchButton = UIButton()
    lazy var stackView = UIStackView()
    lazy var imageView = UIImageView()
    lazy var viewModel = PlacesVM.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override func setUpUI() {
        setUI()
    }
}
