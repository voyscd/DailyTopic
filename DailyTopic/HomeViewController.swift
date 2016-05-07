//
//  HomeViewController.swift
//  DailyTopic
//
//  Created by Daniel on 7/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var secretType = "Secret"
    var publishedType = "Published"
    var nearbyType = "Nearby"
    var selectedType = "Secret"
    var topicsList : NSMutableArray
    
    required init?(coder aDecoder: NSCoder)
    {
        self.topicsList = NSMutableArray()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var tableview: UITableView!

    
    @IBAction func segmentedAction(sender: UISegmentedControl) {
       selectedType = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
       tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.reloadData()
    }
  
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section)
        {
        case 0: return 3
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell",forIndexPath: indexPath) as! TopicCell
            
            
            
            if selectedType == "Secret"
            {
                
                let firebase = Firebase(url:"https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret")
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                
                
                firebase.observeEventType(.Value, withBlock: { snapshot in
                    
                    
                    for item in snapshot.children{
                        let topic = item as! FDataSnapshot
                        
                        cell.TopicTitle.text = topic.value.objectForKey("TopicTitle") as! String
                        let base64String = topic.value.objectForKey("TopicPicture") as! String
                        
                        cell.TopicPicture.image = self.convertBase64ToImage(base64String)
                        
                        
                        
                    }
                    
                })
                
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
            }
            
            if selectedType == "Published"
            {
                
                cell.TopicTitle.text = "published"
                cell.imageView!.image = nil
                
            }
            
            if selectedType == "Nearby"
            {
                
                cell.TopicTitle.text = "nearby"
                cell.imageView!.image = nil
                
            }
            
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("NoTopicCell",forIndexPath: indexPath)
            
            return cell
            
        }
        
    }
    
    
    //Conver images into base64 and keep them into string
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters )
        
        var decodedImage = UIImage(data: decodedData!)
        
        return decodedImage!
    }
    
    
    
}
