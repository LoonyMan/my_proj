//
//  CountriesTableController.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//

import UIKit

class CountriesTableController: UITableViewController {

    
    
    var countries: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = CountriesHelper.getCountries()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let name = NSLocale(localeIdentifier: "en").displayName(forKey: NSLocale.Key.identifier, value: countries![indexPath.row])
        
        if name != nil {
            cell.textLabel?.text = "\(CountriesHelper.flag(country: countries![indexPath.row])) \(name!)"
            
        }
        return cell
    }
	
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "detailController") as! DetailViewController
        vc.countryLabel?.text = tableView.cellForRow(at: indexPath)?.textLabel?.text //???????
        
        self.navigationController?.popViewController(animated: true)
    }

}




