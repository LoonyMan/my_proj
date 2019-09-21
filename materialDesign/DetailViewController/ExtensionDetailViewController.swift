//
//  ExtensionDetailViewController.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//
import UIKit
import Foundation

extension DetailViewController: UITextFieldDelegate {
    
    @objc func cityDidChange(_ textField: UITextField) {
        if textField.text?.count != 0 {
            boolArray[4] = true
        } else {
            boolArray[4] = false
        }
        checkBoolArray()
    }
    
    @objc func postCodeDidChange(_ textField: UITextField) {
        if textField.text?.count != 0 {
            boolArray[3] = true
        } else {
            boolArray[3] = false
        }
        checkBoolArray()
    }
    
    @objc func thirdDidChange(_ textField: UITextField) {
        if textField.text?.count != 0 {
            boolArray[2] = true
        } else {
            boolArray[2] = false
        }
        checkBoolArray()
    }
    
    @objc func secondDidChange(_ textField: UITextField) {
        if textField.text?.count != 0 {
            boolArray[1] = true
        } else {
            boolArray[1] = false
        }
        checkBoolArray()
    }
    
    @objc func firstDidChange(_ textField: UITextField) {
        if textField.text?.count != 0 {
            boolArray[0] = true
        } else {
            boolArray[0] = false
        }
        checkBoolArray()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
