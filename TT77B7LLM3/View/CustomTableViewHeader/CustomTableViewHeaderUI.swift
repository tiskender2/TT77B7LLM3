//
//  CustomTableViewHeaderUI.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension CustomTableViewHeader {
    func setUI(){
        let view = UIView()
        addSubview(view)
        self.backgroundColor = viewColor
        view.frame = self.bounds
        headerStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 0, view: view)
        headerStackView.addArrangedSubview(setUpTitleLabel())
        headerStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    fileprivate func setUpTitleLabel() -> UILabel {
        titleLabel.font = .robotoMedium15
        titleLabel.textColor = .black
        titleLabel.text = title
        return titleLabel
    }
}
