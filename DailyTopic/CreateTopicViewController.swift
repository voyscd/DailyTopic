//
//  CreateTopicViewController.swift
//  DailyTopic
//
//  Created by Daniel on 30/04/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class CreateTopicViewController: UIViewController {

    
    
    @IBAction func addNotificationTapped(sender: AnyObject) {
        
        // Add a bage to the featured page
        for item in (self.tabBarController?.tabBar.items!)!
        {
            if item.tag == 1{
                item.badgeValue = "NEW"
            }

        }
        
    }
    
    
    

}
