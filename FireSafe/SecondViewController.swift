//
//  SecondViewController.swift
//  FireSafe
//
//  Created by Chris on 12/14/16.
//  Copyright © 2016 Host Your Space. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet var table: UITableView!
    
    var cName: [String] = []
    var cPhone: [String] = []

    
        let firstName = UserDefaults.standard.object(forKey: "firstName")
        let phoneNum = UserDefaults.standard.object(forKey: "phoneNum")
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return cName.count
        }
    
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "contact")
            
            cell.textLabel?.text = cName[indexPath.row]
            
            cell.detailTextLabel?.text = cPhone[indexPath.row]

            return cell
        
        }
   
    func editButtonPressed(){
        table.setEditing(!table.isEditing, animated: true)
        if table.isEditing == true{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: Selector(("editButton")))
        }else{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: Selector(("editButton")))
        }
        
        
        
    }
    
    @IBAction func editButton(_ sender: Any) {
        table.setEditing(!table.isEditing, animated: true)
    }
    

//    @IBAction func addContact(_ sender: AnyObject) {
//        
//        var store = CNContactStore()
//        
//        
//        func checkAccessStatus(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
//            let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
//            
//            switch authorizationStatus {
//            case .authorized:
//                completionHandler(true)
//            case .denied, .notDetermined:
//                store.requestAccess(for: CNEntityType.contacts, completionHandler: { (access, accessError) -> Void in
//                    if access {
//                        completionHandler(access)
//                    } else {
//                        print("access denied")
//                    }
//                })
//            default:
//                completionHandler(false)
//            }
//        }
    
//        let contactView = CNContactPickerViewController()
//        contactView.delegate = self
//        present(contactView, animated: true, completion: nil)
//        
//        let newContact = CNMutableContact()
//        
//        newContact.givenName = "Apps"
//        newContact.middleName = "Foundations"
//        newContact.nickname = "AF"
//        
//        if let image = UIImage(named: "logo-apps-foundation"),
//            let data = UIImagePNGRepresentation(image){
//            newContact.imageData = data
//        }
//
//        let phone = CNLabeledValue(label: CNLabelWork, value:CNPhoneNumber(stringValue: "+441234567890"))
//        newContact.phoneNumbers = [phone]
//    
//        
//        newContact.jobTitle = "Apps Foundation"
//        newContact.organizationName = "Apps Foundation"
//        newContact.departmentName = "IT"
//        
//        let facebookProfile = CNLabeledValue(label: "Facebook", value: CNSocialProfile(urlString: "https://www.facebook.com/appsfoundation", username: "AppsFoundation", userIdentifier: "appsfoundation", service: CNSocialProfileServiceFacebook))
//        
//        let twitterProfile = CNLabeledValue(label: "Twitter", value: CNSocialProfile(urlString: "https://twitter.com/AppsFoundation", username: "AppsFoundation", userIdentifier: "appsfoundation", service: CNSocialProfileServiceTwitter))
//        newContact.socialProfiles = [facebookProfile, twitterProfile]
//        
//        let skypeProfile = CNLabeledValue(label: "Skype", value: CNInstantMessageAddress(username: "AppsFoundation", service: CNInstantMessageServiceSkype))
//        newContact.instantMessageAddresses = [skypeProfile]
//        
//        let birthday = NSDateComponents()
//        birthday.year = 1991
//        birthday.month = 1
//        birthday.day = 1
//        newContact.birthday = birthday as DateComponents
//        
//        let request = CNSaveRequest()
//        request.add(newContact, toContainerWithIdentifier: nil)
//        do{
//            try store.execute(request)
//        } catch let error{
//            print(error)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let contactNameObject = UserDefaults.standard.object(forKey: "contactName")
        let contactPhoneObject = UserDefaults.standard.object(forKey: "contactPhone")
        
        if let tempName = contactNameObject as? [String] {
            
            cName = tempName
        }
        
        if let tempPhone = contactPhoneObject as? [String] {
            
            cPhone = tempPhone
        }
        
        table.reloadData()
        print(contactPhoneObject as Any)
        print(contactNameObject as Any)
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
