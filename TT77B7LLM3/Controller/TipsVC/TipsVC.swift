//
//  TipsVC.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class TipsVC: BaseVC {
    lazy var tableView = UITableView()
    lazy var viewModel = TipsVM.shared
    lazy var dissmisView = UIView()
    var currentVenue: Venue?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        fetch()
    }
    override func setUpUI() {
        setUI()
    }
    fileprivate func fetch(){
        viewModel.delegate = self
        viewModel.fetchTips()
        viewModel.fetchPhotos()
    }
    
}
extension TipsVC: TipsVMDelegate {
    func fetchTips() {
        DispatchQueue.main.async {
            self.tableView.reloadSections([TipVCSections.tips.rawValue], with: .none)
        }
    }
    
    func fetchPhotos() {
          DispatchQueue.main.async {
            self.tableView.reloadSections([TipVCSections.photo.rawValue], with: .none)
        }
    }    
}
