//
//  BaseVC.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 11.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

class BaseVC: UIViewController {
    
    func setUpUI(){}
    
    func showAlert(title:String,body:String){
        AlertManager.shared.showAlert(title: title, body: body)
    }
}
