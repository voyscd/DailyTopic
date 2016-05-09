//
//  FavouriteViewController.swift
//  DailyTopic
//
//  Created by Daniel on 4/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class FavouriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var FavouriteTopicsList : NSArray?
    
    required init?(coder aDecoder: NSCoder)
    {
        self.FavouriteTopicsList = [Topic]()
        super.init(coder: aDecoder)
    }
    
     override func viewDidAppear(animated: Bool) {
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FavouriteTopicsCell", forIndexPath: indexPath) as! FavouriteTopicsCell
        
        
        return cell
    }
    
    
    
}
