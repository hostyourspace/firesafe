//
//  ModalViewController.swift
//  FireSafe
//
//  Created by Chris on 12/15/16.
//  Copyright © 2016 Host Your Space. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController{

    @IBOutlet var textField: UITextView!
    
    @IBAction func saveAlert(_ sender: Any) {
        
        var alerts:[String]
        
        let alertsObject = UserDefaults.standard.object(forKey: "alerts")
        
        
        if let tempAlerts = alertsObject as? [String] {
            
            alerts = tempAlerts
            
            alerts.append(textField.text!)
            
            print(alerts)
            
        } else {
            
            alerts = [textField.text!]
            
        }
        
        UserDefaults.standard.set(alerts, forKey: "alerts")
        textField.text = ""
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        
    }

    
}
