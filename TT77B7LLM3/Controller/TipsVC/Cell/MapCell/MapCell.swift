//
//  MapCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 14.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class MapCell: BaseCell {
    
    lazy var mapView = MKMapView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         setUpCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setLocationToMap(venue:Venue?){
        
        let annotations = MKPointAnnotation()
        let view = mapView.view(for: annotations)
        view?.prepareForDisplay()
        annotations.title = venue?.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
            venue?.location?.lat ?? 0.0, longitude: venue?.location?.lng ?? 0.0)
        mapView.addAnnotation(annotations)
        let mapAnnotations = mapView.annotations
        mapView.showAnnotations(mapAnnotations, animated: true) // Kamerayı lokasyona zoomlamak için
        mapView.camera.altitude *= 1.4 // Kamerayı daha hızlı zoom yapması için (1.4 katı kadar hızda zoom yapıyor)
    }
    deinit {
        mapView.annotations.forEach{mapView.removeAnnotation($0)} // önceden lokasyona koyulan pinleri siliyorum
        mapView.delegate = nil
        print("deinit: MapCell")
    }
}

