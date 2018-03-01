//
//  AddViewController.swift
//  Maps_temp
//
//  Created by Fausto Checa on 28/2/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var arrayPlace2: [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        let address = addressTextField.text
        let city = cityTextField.text
        arrayPlace2 = [address!, city!]
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vcDestination = segue.destination as? MapViewController {
            vcDestination.arrayPlace = arrayPlace2
            
        }
    }

}
