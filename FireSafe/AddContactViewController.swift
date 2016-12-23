//
//  AddContactViewController.swift
//  FireSafe
//
//  Created by Chris on 12/16/16.
//  Copyright © 2016 Host Your Space. All rights reserved.
//

import UIKit
import CoreData

class AddContactViewController: UIViewController{
    
    //Outputs from the ViewController
    @IBOutlet var firstName: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    
//Actions from the ViewController
    @IBAction func saveContact(_ sender: Any) {
        
        var contactName:[String]
        var contactPhone:[String]
        
        let contactNameObject = UserDefaults.standard.object(forKey: "contactName")
        
        let contactPhoneObject = UserDefaults.standard.object(forKey: "contactPhone")
        
        
        if let tempContactName = contactNameObject as? [String] {
            
            contactName = tempContactName
            
            contactName.append(firstName.text!)
            
            print(contactName)
            
            
        } else {
            
            contactName = [firstName.text!]
            
        }
        
        UserDefaults.standard.set(contactName, forKey: "contactName")
        firstName.text = ""
        
        if let tempContactPhone = contactPhoneObject as? [String] {
            
            contactPhone = tempContactPhone
            
            contactPhone.append(phoneNumber.text!)

        }
        
        else {
            
            contactPhone = [phoneNumber.text!]
        }
        
        UserDefaults.standard.set(contactPhone, forKey: "contactPhone")
        phoneNumber.text = ""
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        }
    
}
