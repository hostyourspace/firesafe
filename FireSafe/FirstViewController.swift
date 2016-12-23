//
//  FirstViewController.swift
//  FireSafe
//
//  Created by Chris on 12/14/16.
//  Copyright © 2016 Host Your Space. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var alerts: [String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return alerts.count
    }
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "alertText")
        
        cell.textLabel?.text =  alerts[indexPath.row]
        return cell
    }
    
//    @IBAction func createAlert(_ sender: Any) {
//        
//        func showModal() {
//            let modalViewController = ModalViewController()
//            modalViewController.modalPresentationStyle = .overCurrentContext
//            present(modalViewController, animated: true, completion: nil)
//        }
//        
//        showModal()
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "alerts")
        
        
        if let tempAlerts = itemsObject as? [String] {
            
            alerts = tempAlerts
            
        }
        
        table.reloadData()
        print(itemsObject as Any)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if  segue.identifier == "FirstVCtoSendAlertVC" {
//            let destination = segue.destination as? SendAlertVC
//            let alertIndex = self.alerts.indexPathForSelectedRow?.row
//            destination.alertPicker = viewDidAppear.alerts[alertIndex]
//            }
//    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    } {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    



}

