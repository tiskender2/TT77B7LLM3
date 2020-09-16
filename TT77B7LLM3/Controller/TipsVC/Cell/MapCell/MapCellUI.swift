//
//  MapCellUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MapKit

extension MapCell {
    
    func setUpCell(){
        setUpMapView()
    }
    fileprivate func setUpMapView(){
        let view = UIView()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(200)
        }
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}
