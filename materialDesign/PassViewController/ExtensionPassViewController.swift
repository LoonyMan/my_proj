//
//  ExtensionPassViewController.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//
import UIKit
import Foundation

extension PassViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 3
        let currentString = textField.text ?? ""
        guard let stringRange = Range(range, in: currentString) else { return false }
        let newString = currentString.replacingCharacters(in: stringRange, with: string)
        return newString.count <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
