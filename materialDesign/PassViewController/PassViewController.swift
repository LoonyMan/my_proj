//
//  PassViewController.swift
//  
//
//  Created by Mihail on 17/09/2019.
//
import MaterialComponents
import UIKit

class PassViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var securityCodeField: MDCTextField!
    
    
    @IBAction func nextController(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "detailController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var securityCodeController: MDCTextInputControllerUnderline!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomLabel()
        setupDesign()
        securityCode()
        
    }
    
    @objc func securityCodeFieldDidChange(_ textField: UITextField) {
        codeLabel.text = textField.text
        if textField.text?.count == 3 {
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    func securityCode() {
        securityCodeController = DesignTextField.setupController(textField: securityCodeField)
        securityCodeField.font = .montserratMedium
        securityCodeField.delegate = self
        securityCodeField.addTarget(self, action: #selector(securityCodeFieldDidChange(_:)), for: .allEditingEvents)
        securityCodeField.keyboardType = .numberPad
    }
    
    func setupDesign() {
        subView.backgroundColor = .darkSkyBlue
        codeLabel.textColor = .greyishBrown
        codeLabel.font = .montserratRegular
    }
    
    func setupCustomLabel() {
        let attributedString = NSMutableAttributedString(string: "Card must be on your name", attributes: [
            .font: UIFont(name: "Montserrat-Light", size: 14.0)!,
            .foregroundColor: UIColor.paleGrey,
            .kern: 0.0
            ])
        attributedString.addAttribute(.font, value: UIFont(name: "Montserrat-Medium", size: 14.0)!, range: NSRange(location: 16, length: 9))
        customLabel.attributedText = attributedString
    }

}

