//
//  TipsUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
enum TipVCSections: Int,CaseIterable {
    case map = 0
    case photo
    case tips
    case loading
}
extension TipsVC {
    
    func setUI(){
        setUpTableView()
        addActionToContentView()
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
        tableView.register(MapCell.self, forCellReuseIdentifier: "MapCell")
        tableView.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.register(TipCell.self, forCellReuseIdentifier: "TipCell")
        tableView.register(LoadingCell.self, forCellReuseIdentifier: "LoadingCell")
        tableView.backgroundColor = .silver
        let contentView = UIView()
        contentView.layer.cornerRadius = 18
        contentView.clipsToBounds = true
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
        view.addSubview(dissmisView)
        view.addSubview(contentView)
        view.backgroundColor = .blackWithAlpha
        contentView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(view).multipliedBy(0.8)
            make.center.equalToSuperview()
        }
        dissmisView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
    }
    fileprivate func addActionToContentView(){
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.dissmisAction))
        self.dissmisView.addGestureRecognizer(gesture)
    }
}
extension TipsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TipVCSections.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TipVCSections(rawValue: section)
        switch section {
        case .map, .photo:
            return 1
        case .tips:
            return viewModel.getTipsCount()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TipVCSections(rawValue: indexPath.section)
        switch section {
        case .map:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
            cell.setLocationToMap(venue: currentVenue)
            return cell
        case .photo:
            if viewModel.sections?[section?.rawValue ?? 3] == .loading {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
                if viewModel.noVenueImage {
                    cell.stopAnimating(infoText: cell.noVenueImageInfo)
                } else {
                    cell.startAnimating()
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
                cell.setCell(venue: currentVenue, photos: viewModel.getPhotosItem())
                return cell
            }
        case .tips:
            if viewModel.sections?[section?.rawValue ?? 3] == .loading {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
                if viewModel.noComment {
                    cell.stopAnimating(infoText: cell.noCommentInfo)
                } else {
                    cell.startAnimating()
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TipCell", for: indexPath) as! TipCell
                cell.setCell(tip: viewModel.getTipItem(indexPath: indexPath))
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = TipVCSections(rawValue: section)
        if sectionTitle == .tips {
            let view = CustomTableViewHeader(title: "Tips",viewColor: .paleGrey)
            return view
        } else if sectionTitle == .photo {
            let view = CustomTableViewHeader(title: "",viewColor: .white)
            return view
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionTitle = TipVCSections(rawValue: section)
        if sectionTitle == .tips {
            return 30
        } else if sectionTitle == .photo {
            return 10
        }
        return 0
    }
}
// MARK: UITableViewDelegate
extension TipsVC: UITableViewDelegate {
    
}
//MARK: Action
extension TipsVC {
    @objc func dissmisAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
