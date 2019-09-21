//
//  ExtensionMainController.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//
import UIKit
import Foundation

extension MainController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNumber {
            let maxLength = 19
            let currentString = textField.text ?? ""
            guard let stringRange = Range(range, in: currentString) else { return false }
            let newString = currentString.replacingCharacters(in: stringRange, with: string)
            return newString.count <= maxLength
            
        }
        else {
            let maxLength = 5
            let currentString = textField.text ?? ""
            guard let stringRange = Range(range, in: currentString) else { return false }
            let newString = currentString.replacingCharacters(in: stringRange, with: string)
            return newString.count <= maxLength
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setTextInInfoLabel() {
        let attributedString = NSMutableAttributedString(string: "Card must be on your name", attributes: [
            .font: UIFont(name: "Montserrat-Light", size: 14.0)!,
            .foregroundColor: UIColor.paleGrey,
            .kern: 0.0
            ])
        attributedString.addAttribute(.font, value: UIFont(name: "Montserrat-Medium", size: 14.0)!, range: NSRange(location: 16, length: 9))
        infoLabel.attributedText = attributedString
    }
}


