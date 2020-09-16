//
//  CustomTableViewHeader.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class CustomTableViewHeader: UIView {
    lazy var headerStackView = UIStackView()
    lazy var titleLabel = UILabel()
    var title:String?
    var viewColor:UIColor?
    
    init(title: String,viewColor:UIColor) {
        self.title = title
        self.viewColor = viewColor
        super.init(frame: CGRect.zero)
        commonInit()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
      setUI()
    }
}
