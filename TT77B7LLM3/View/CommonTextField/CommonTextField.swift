//
//  CommonTextField.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 11.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit


class CommonTextField: UITextField {
    
    var textFieldDidEndEditing : ((_ text : String) -> ())?
    var textFieldDidChange : ((_ text : String) -> ())?
    var textFieldDidBeginEditing : (()->())?
    var isJustLetter: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
    }
    
    @objc func textChanged(textField: UITextField){
        textFieldDidChange?(self.text!)
    }
    
}

extension CommonTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.textFieldDidBeginEditing?()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.textFieldDidEndEditing?(textField.text!)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isJustLetter {
            if string.rangeOfCharacter(from: .letters) != nil || string == " " || string.isBackspace {
                return true
            }else {
                return false
            }
        } else {
            return true
        }
    }
}
extension String {
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
}
