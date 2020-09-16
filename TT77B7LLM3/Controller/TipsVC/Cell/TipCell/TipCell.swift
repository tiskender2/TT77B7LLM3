//
//  TipCell.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 15.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

class TipCell: BaseCell {
    
    lazy var contenStackView = UIStackView()
    lazy var nameAndDateStackView = UIStackView()
    lazy var nameLabel = UILabel()
    lazy var dateLabel = UILabel()
    lazy var imageAndTipStackView = UIStackView()
    lazy var tipImageView = UIImageView()
    lazy var tipLabel = UILabel()
    lazy var userImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(tip:Item?) {
        nameLabel.text = (tip?.user?.firstName ?? "") + " " + (tip?.user?.lastName ?? "" )
        dateLabel.text = tip?.createdAt?.dateFormatTime()
        tipLabel.text = tip?.text
        let userImage = "\(tip?.user?.photo?.prefix ?? "")\(tip?.user?.photo?.defaultUserPhotoSize ?? "100x100")\(tip?.user?.photo?.suffix ?? "")"
        setUserPhotoImg(image: userImageView, imgLink: userImage)
        customizeCommentImageVisibity(tip:tip)
       
    }
    fileprivate func customizeCommentImageVisibity(tip:Item?){
        if tip?.photo == nil {
            tipImageView.isHidden = true
        } else {
            let image = "\(tip?.photo?.photoPrefix ?? "")\(tip?.defaultCommentPhotoSize ?? "300x200")\(tip?.photo?.suffix ?? "")"
            print(image)
            setImg(image: tipImageView, imgLink: image)
            tipImageView.isHidden = false
        }
    }
}
