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
    
    
    @IBAction func logoutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        self.logoutButton.hidden = true
        self.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
