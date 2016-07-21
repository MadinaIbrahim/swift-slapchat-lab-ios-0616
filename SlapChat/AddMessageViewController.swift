//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Madina Ibrahim on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    var dataStore = DataStore() // data store to access CoreData database
    // add an outlet for the text field
    @IBOutlet weak var messageTextField: UITextField!
    // add an action function to save the message (textfield's text) and current NSDate()
    // dismiss this view controller after save

    @IBAction func saveButton(sender: AnyObject) {
        print("save button tapped")
        if (messageTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "") {
            let message: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: dataStore.managedObjectContext) as! Message
            
            message.content = messageTextField.text
            message.createdAt = NSDate()
            
            dataStore.saveContext()
            //this V is for present modally
            //self.dismissViewControllerAnimated(true, completion:nil)
            
            navigationController?.popViewControllerAnimated(true)
            // ^ use popViewControllerAnimated for show/push
    }
}
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        //self.dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is the model you want to follow when
        // adding a new object into the database
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
