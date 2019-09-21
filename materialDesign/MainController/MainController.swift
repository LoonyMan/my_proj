//
//  MainController.swift
//  
//
//  Created by Mihail on 08/09/2019.
//

import UIKit
import MaterialComponents

class MainController: UIViewController {
    
    @IBOutlet weak var typeCard: UIImageView!
    @IBOutlet weak var expiresTextField: MDCTextField!
    @IBOutlet weak var cardNumber: MDCTextField!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var nameHolder: UILabel!
    @IBOutlet weak var validThru: UILabel!
    @IBOutlet weak var passCode: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func clickNextButton(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "cvcController")
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    var expiresController: MDCTextInputControllerUnderline?
    var cardNumberController: MDCTextInputControllerUnderline?
    var lastCardNumber: String = ""
    var lastExpires: String = ""
    var temp = 0
    var tempBool = false
    var firstCheck = false
    var secondCheck = false
    var activityBtn = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setTextInInfoLabel()
        setKeyboardType()
        setupDesign()
        designExpires()
        designCardNumber()
        
    }
    
    func designCardNumber() {
        cardNumberController = DesignTextField.setupController(textField: cardNumber)
        cardNumber.font = .montserratMedium
        cardNumber.textColor = .greyishBrown
        cardNumber.delegate = self
        cardNumber.addTarget(self, action: #selector(cardNumberDidChange(_:)), for: .allEditingEvents)
    }
    
    func designExpires() {
        expiresController = DesignTextField.setupController(textField: expiresTextField)
        expiresTextField.font = .montserratMedium
        expiresTextField.textColor = .greyishBrown
        expiresTextField.delegate = self
        expiresTextField.addTarget(self, action: #selector(expiresDidChange(_:)), for: .allEditingEvents)
    }
    
    func setupDesign() {
        nameHolder.textColor = .warmGrey
        validThru.textColor = .warmGrey
        passCode.textColor = .warmGrey
        cardLabel.textColor = .warmGrey
        blueView.backgroundColor = .darkSkyBlue
    }
    
    func setKeyboardType() {
        expiresTextField.keyboardType = .numberPad
        cardNumber.keyboardType = .numberPad
    }
    
    func setTrueFirstCheck() {
        firstCheck = true
        if secondCheck == true {
            activityButton()
        }
    }

    func setFalseFisrtCheck() {
        firstCheck = false
        nextButton.isEnabled = false
        activityBtn = false
    }
    
    func setTrueSecondCheck() {
        secondCheck = true
        if firstCheck == true {
            activityButton()
        }
    }
    
    func setFalseSecondCheck() {
        secondCheck = false
        nextButton.isEnabled = false
        activityBtn = false
    }
    
    func activityButton() {
        nextButton.isEnabled = true
        activityBtn = true
    }
    
    @objc func expiresDidChange(_ textField: UITextField) {
        if textField.text!.count > lastExpires.count {
            if textField.text!.count % 3 == 0 {
                textField.text?.insert("/", at: String.Index(encodedOffset: textField.text!.count - 1))
                
            }
        } else {
            if textField.text!.count % 3 == 0 && !textField.text!.isEmpty{
                if lastExpires.count - 1 == textField.text?.count {
                    textField.text?.remove(at: String.Index(encodedOffset: textField.text!.count - 1))
                }
            }
        }
        
        if expiresTextField.text!.count == 5 {
            setTrueSecondCheck()
        } else {
            setFalseSecondCheck()
        }
        
        lastExpires = textField.text!
        setExpiresLabel(textField: textField)
    }
    
    func setExpiresLabel(textField: UITextField) {
        var defText = "**/**"
        let startIndex = defText.startIndex..<defText.index(defText.startIndex, offsetBy: textField.text!.count)
        defText.removeSubrange(startIndex)
        var newLine = NSMutableAttributedString(string: textField.text! + defText, attributes: [
            .font: UIFont(name: "Montserrat-Regular", size: 15.0)!,
            .foregroundColor: UIColor.greyishBrown,
            .kern: 0.0
            ])
        newLine.addAttribute(.font, value: UIFont(name: "Montserrat-Regular", size: 15.0)! , range: NSRange(location: textField.text!.count, length: defText.count))
        newLine.addAttribute(.foregroundColor, value: UIColor.warmGrey, range: NSRange(location: textField.text!.count, length: defText.count))
        passCode.attributedText = newLine
    }
    
    @objc func cardNumberDidChange(_ textField: UITextField) {
        if textField.text!.count > lastCardNumber.count {
            if textField.text!.count % 5 == 0 {
                textField.text?.insert(" ", at: String.Index(encodedOffset: textField.text!.count - 1))
            }
        } else {
            if textField.text!.count % 5 == 0 && !textField.text!.isEmpty{
                if lastCardNumber.count - 1 == textField.text?.count {
                    textField.text?.remove(at: String.Index(encodedOffset: textField.text!.count - 1))
                }
            }
        }
        lastCardNumber = textField.text!
        if textField.text?.count != 0 && textField.text?.first == "4" {
            typeCard.image = UIImage(named: "imVisa")
        } else {
            typeCard.image = nil
        }
        if cardNumber.text!.count == 19 {
            setTrueFirstCheck()
        } else {
            setFalseFisrtCheck()
        }
        setCardLabel(textField: textField)
    }
    
    func setCardLabel(textField: UITextField) {
        var defText = "**** **** **** ****"
        let startIndex = defText.startIndex..<defText.index(defText.startIndex, offsetBy: textField.text!.count)
        defText.removeSubrange(startIndex)
        var newLine = NSMutableAttributedString(string: textField.text! + defText, attributes: [
            .font: UIFont(name: "Montserrat-Regular", size: 14.0)!,
            .foregroundColor: UIColor.greyishBrown,
            .kern: 0.0
            ])
        newLine.addAttribute(.font, value: UIFont(name: "Montserrat-Regular", size: 22.0)! , range: NSRange(location: textField.text!.count, length: defText.count))
        newLine.addAttribute(.foregroundColor, value: UIColor.warmGrey, range: NSRange(location: textField.text!.count, length: defText.count))
        cardLabel.attributedText = newLine
    }
    
}
