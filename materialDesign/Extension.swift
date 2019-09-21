//
//  Extension.swift
//  materialDesign
//
//  Created by Mihail on 17/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class DesignTextField {
    static func setupController(textField: MDCTextField) -> MDCTextInputControllerUnderline {
        var controller = MDCTextInputControllerUnderline(textInput: textField)
        controller.textInputClearButtonTintColor = .white
        controller.normalColor = UIColor.blueGrey.withAlphaComponent(0.3)
        controller.inlinePlaceholderFont = .montserratMedium
        controller.normalColor = .blueGrey
        controller.activeColor = .darkSkyBlue
        controller.disabledColor = .blueGrey
        return controller
    }
    
}


//MARK: DESIGN
extension UIFont {
    class var montserratMedium: UIFont {
        return UIFont(name: "Montserrat-Medium", size: 16.0)!
    }
    class var montserratLight: UIFont {
        return UIFont(name: "Montserrat-Light", size: 16.0)!
    }
    class var montserratLight_12: UIFont {
        return UIFont(name: "Montserrat-Light", size: 12.0)!
    }
    class var montserratRegular: UIFont {
        return UIFont(name: "Montserrat-Regular", size: 16.0)!
    }
}

extension UIColor {
    @nonobjc class var blueGrey: UIColor {
        return UIColor(red: 130.0 / 255.0, green: 141.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 59.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleGrey: UIColor {
        return UIColor(red: 231.0 / 255.0, green: 236.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var warmGrey: UIColor {
        return UIColor(white: 161.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkSkyBlue: UIColor {
        return UIColor(red: 64.0 / 255.0, green: 174.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
    }
}

