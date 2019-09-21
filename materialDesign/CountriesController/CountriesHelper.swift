//
//  CoutriesHelper.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//

import Foundation

class CountriesHelper {
    static func flag(country:String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in country.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
    static func getCountries() -> [String] {
        var array: [String] = []
        for i in NSLocale.isoCountryCodes {
            if NSLocale(localeIdentifier: "en").displayName(forKey: NSLocale.Key.identifier, value: i) != nil {
                array.append(i)
            }
        }
        return array
    }
}
