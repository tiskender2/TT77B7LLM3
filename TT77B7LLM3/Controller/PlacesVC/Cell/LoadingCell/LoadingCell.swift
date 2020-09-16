//
//  LoadingCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class LoadingCell: BaseCell {
    lazy var indicator = UIActivityIndicatorView()
    lazy var emptyLabel = UILabel()
    let noCommentInfo = "Bu mekana henuz bir yorum yapılmamış."
    let noVenueImageInfo = "Bu mekana ait herhangi bir resim bulunmuyor."
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startAnimating(){
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
    }
    func stopAnimating(infoText:String = "Aradığınız kriterlere uygun sonuc bulunamadı."){
        indicator.stopAnimating()
        setUpNilDataLabel(infoText:infoText)
    }
    
    fileprivate func setUpNilDataLabel(infoText:String){
        indicator.removeFromSuperview()
        contentView.addSubview(emptyLabel)
        emptyLabel.text = infoText
        emptyLabel.font = .robotoMedium17
        emptyLabel.textColor = .blueWithAHintOfPurple
        emptyLabel.textAlignment = .center
        emptyLabel.numberOfLines = 0
        emptyLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(16)
        }
        
    }
    
}
