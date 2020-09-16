//
//  AlertManager.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 13.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages
class AlertManager {
    static let shared = AlertManager()
    
    func showAlert(title:String,body:String,showButton:Bool=true,color:UIColor = .blurple){
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(backgroundColor: color, foregroundColor: .white)
        error.configureContent(title: title, body: body)
        error.configureIcon(withSize: CGSize(width: 0 , height: 0))
        error.button?.isHidden = showButton
        SwiftMessages.show(view: error)
    }
}
