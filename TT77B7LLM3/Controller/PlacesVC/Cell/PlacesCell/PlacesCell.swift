//
//  PlacesCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

class PlacesCell: BaseCell {
    lazy var contentStackView = UIStackView()
    lazy var labelsStackView = UIStackView()
    lazy var locationStackView = UIStackView()
    lazy var cityLabel = UILabel()
    lazy var addressLabel = UILabel()
    lazy var countryLabel = UILabel()
    lazy var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(venue:Venue?){
        titleLabel.text = venue?.name
        addressLabel.text = venue?.location?.address
        cityLabel.text = venue?.location?.city
        countryLabel.text = venue?.location?.country
    }
}
