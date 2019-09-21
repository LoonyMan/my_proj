//
//  DetailViewController.swift
//  materialDesign
//
//  Created by Mihail on 19/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//

import UIKit
import MaterialComponents

class DetailViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var postCodeTextField: MDCTextField!
    @IBOutlet weak var cityTextField: MDCTextField!
    @IBOutlet weak var secondTextField: MDCTextField!
    @IBOutlet weak var firstTextField: MDCTextField!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var thirdTextField: MDCTextField!
    
    @IBAction func saveButtonClick(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "unsec")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func touchCountry(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let tableController = story.instantiateViewController(withIdentifier: "countriesController")
        self.navigationController?.pushViewController(tableController, animated: true)
        thirdTextField.resignFirstResponder()
    }
    
    var boolArray = [false, false, true, false, false]
    
    var firstController: MDCTextInputControllerUnderline!
    var secondController: MDCTextInputControllerUnderline!
    var thirdController: MDCTextInputControllerUnderline!
    var cityController: MDCTextInputControllerUnderline!
    var postCodeController: MDCTextInputControllerUnderline!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        
        
        
        firstDesign()
        secondDesign()
        thirdDesign()
        cityDesign()
        postCodeDesign()
        countryLabelDesign()
        
        setupDesign()
        
    }
    
    func countryLabelDesign() {
       
        let random = CountriesHelper.getCountries().randomElement()
        let name = NSLocale(localeIdentifier: "en").displayName(forKey: NSLocale.Key.identifier, value: random!)
        countryLabel.text = "\(CountriesHelper.flag(country: random!)) \(name!)"
        countryLabel.sizeToFit()
    }
    
    func firstDesign() {
        firstController = DesignTextField.setupController(textField: firstTextField)
        firstTextField.addTarget(self, action: #selector(firstDidChange(_:)), for: .allEditingEvents)
        firstTextField.font = .montserratMedium
        firstTextField.textColor = .greyishBrown
        firstTextField.delegate = self
        firstTextField.autocorrectionType = .no
    }
    
    func secondDesign() {
        secondController = DesignTextField.setupController(textField: secondTextField)
        secondTextField.addTarget(self, action: #selector(secondDidChange(_:)), for: .allEditingEvents)
        secondTextField.font = .montserratMedium
        secondTextField.textColor = .greyishBrown
        secondTextField.delegate = self
        secondTextField.autocorrectionType = .no
    }
    
    func thirdDesign() {
        thirdController = DesignTextField.setupController(textField: thirdTextField)
        thirdTextField.addTarget(self, action: #selector(thirdDidChange(_:)), for: .allEditingEvents)
        thirdTextField.font = .montserratMedium
        thirdTextField.textColor = .greyishBrown
        thirdTextField.text = " "
        thirdTextField.delegate = self
    }
    
    func postCodeDesign() {
        postCodeController = DesignTextField.setupController(textField: postCodeTextField)
        postCodeTextField.autocorrectionType = .no
        postCodeTextField.addTarget(self, action: #selector(postCodeDidChange(_:)), for: .allEditingEvents)
        postCodeTextField.font = .montserratMedium
        postCodeTextField.textColor = .greyishBrown
        postCodeTextField.delegate = self
    }
    
    func cityDesign() {
        cityController = DesignTextField.setupController(textField: cityTextField)
        cityTextField.autocorrectionType = .no
        cityTextField.addTarget(self, action: #selector(cityDidChange(_:)), for: .allEditingEvents)
        cityTextField.font = .montserratMedium
        cityTextField.textColor = .greyishBrown
        cityTextField.delegate = self
    }
    
    func setupDesign() {
        subView.backgroundColor = .darkSkyBlue
    }

    func checkBoolArray() {
        var check = false
        for i in boolArray {
            if !i {
                check = true
            }
        }
        if !check {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
    }
}

