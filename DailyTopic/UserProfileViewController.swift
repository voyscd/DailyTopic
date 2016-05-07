//
//  UserProfileViewController.swift
//  DailyTopic
//
//  Created by Daniel on 4/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {

    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLaabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        //Get the User Information from the Firebase
        
        let authData = CURRENT_USER.authData.description.componentsSeparatedByString(" ")
        
        let uid = authData[1]
        
        var ref = Firebase(url:"https://dailytopic-daniel.firebaseio.com/DailyTopic/Users/" + uid)

        print(uid)
        
        
    
        ref.observeEventType(.Value, withBlock: { snapshot in
         
        self.userNameLabel.text  = snapshot.value.objectForKey("UserName") as? String
        self.userEmailLaabel.text = snapshot.value.objectForKey("UserEmail") as? String
        
          
        },withCancelBlock: { error in
            print(error.description)
        })
     
        
        
        
         
    }
    
    
    @IBAction func logoutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        self.logoutButton.hidden = true
        self.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
