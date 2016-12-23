//
//  SendAlertVC.swift
//  FireSafe
//
//  Created by Chris on 12/21/16.
//  Copyright © 2016 Host Your Space. All rights reserved.
//

import UIKit

class SendAlertVC: UIViewController {
    
    var alertIndex = 0
    var contactIndex = 0
    
    
    @IBOutlet var alertPicker: UIPickerView!
    @IBOutlet var contactPicker: UIPickerView!
    
    var aPData: NSMutableArray = NSMutableArray()
    var cPNData: NSMutableArray = NSMutableArray()
    var cPPData: NSMutableArray = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.alertPicker.delegate = self
//        self.alertPicker.dataSource = self
//        self.contactPicker.delegate = self
//        self.contactPicker.dataSource = self
        
        aPData = UserDefaults.standard.object(forKey: "alerts") as! NSMutableArray
        cPPData = UserDefaults.standard.object(forKey: "contactPhone") as! NSMutableArray
        cPNData = UserDefaults.standard.object(forKey: "contactName") as! NSMutableArray
        
        alertPicker.selectedRow(inComponent: alertIndex)
        contactPicker.selectedRow(inComponent: contactIndex)
        
        self.alertPicker = [aPData]
        contactPicker = "/[cPNData] - [cPPData]"
        
        print(aPData)
        print(cPNData)
        print(cPPData)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
