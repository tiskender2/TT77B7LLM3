//
//  PlacesUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
enum RowsEnum: Int,CaseIterable {
    case loading = 0
    case venues
}
extension PlacesVC {
    
    func setUI(){
        viewModel.delegate = self
        setUpTableView()
    }
    fileprivate func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.separatorColor = .pinkishGrey
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(PlacesCell.self, forCellReuseIdentifier: "PlacesCell")
        tableView.register(LoadingCell.self, forCellReuseIdentifier: "LoadingCell")
        view.addSubview(tableView)
        tableView.backgroundColor = .silver
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        navigationItem.title = "Places"
    }
    fileprivate func showTipsVC(venue:Venue?,index:Int){
        let vc = TipsVC()
        vc.currentVenue = venue
        TipsVM.shared.setParams(params: Params(venueID: venue?.id, sort: "popular", limit: "100", offset: "100", group: "venue"))
        vc.modalPresentationStyle = .overCurrentContext // vc present animasyonu pop-up seklinde olması için
        vc.modalTransitionStyle = .crossDissolve // vc present animasyonu pop-up seklinde olması için
        present(vc, animated: true, completion: nil)
    }
}
// MARK: UITableViewDataSource
extension PlacesVC: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.section {
        case .loading:
            return 1
        case .venues:
            return viewModel.getVenuesCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.section {
        case .loading:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
            if viewModel.getVenuesCount() == 0  || viewModel.showErrorMessage {
                 cell.stopAnimating()
            } else {
                 cell.startAnimating()
            }
            return cell
        case .venues:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath) as! PlacesCell
            cell.setCell(venue: viewModel.getVenue(indexPath: indexPath))
            return cell
        }
       
    }
}
// MARK: UITableViewDelegate
extension PlacesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.section == .venues {
            showTipsVC(venue: viewModel.getVenue(indexPath: indexPath), index: indexPath.row)
        }
    }
}
