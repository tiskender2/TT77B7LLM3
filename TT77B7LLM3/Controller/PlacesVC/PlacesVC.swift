//
//  PlacesVC.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

class PlacesVC: BaseVC {
    lazy var tableView = UITableView()
    lazy var viewModel = PlacesVM.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel.fetchVenues()
    }
    override func setUpUI() {
        setUI()
    }
}
extension PlacesVC: PlacesVMDelegate {
    func getVenues() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
