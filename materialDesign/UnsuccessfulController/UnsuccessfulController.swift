//
//  UnsuccessfulController.swift
//  materialDesign
//
//  Created by Mihail on 21/09/2019.
//  Copyright © 2019 Mihail. All rights reserved.
//

import UIKit

class UnsuccessfulController: UIViewController {

    @IBAction func closeButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tryAgainButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
