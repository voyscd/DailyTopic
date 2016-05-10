//
//  HomeViewController.swift
//  DailyTopic
//
//  Created by Daniel on 7/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,saveTopicDelegate{

    var secretType = "Secret"
    var publishedType = "Published"
    var nearbyType = "Nearby"
    var selectedType = "Secret"
    var topicsList : NSArray?
    var favouriteTopicsList: NSArray?
 
    
    
    required init?(coder aDecoder: NSCoder)
    {
        self.topicsList = [Topic]()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    @IBAction func segmentedAction(sender: UISegmentedControl) {
       selectedType = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
       tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

          let firebase = Firebase(url:"https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret")
        
        
        firebase.observeEventType(.Value, withBlock: { snapshot in
            
            
            var newItems = [Topic]()
        
            for item in snapshot.children{
                
                let topicItem = item as! FDataSnapshot
                
                
                let topicTitle  = topicItem.value.objectForKey("TopicTitle") as! String
                let base64String = topicItem.value.objectForKey("TopicPicture") as! String
                
                let topicImage = self.convertBase64ToImage(base64String)
                
                let topicType = "Secret"
                
                let topicMessageCount = topicItem.value.objectForKey("MessagesCount") as! Int
                
                let topicID = topicItem.key
                
                let topic = Topic(newID: topicID, newTitle: topicTitle, newType: topicType, newPicture: topicImage,newMessageCount: topicMessageCount  )
                
               newItems.append(topic)
            
            }
            
            self.topicsList = newItems
            self.tableView.reloadData()
        })
    
        
    }
  
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return self.topicsList!.count
     
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell",forIndexPath: indexPath) as! TopicCell
            
          
            
            print("inner:\(topicsList!.count)")
            
           let t:Topic = self.topicsList![indexPath.row] as! Topic
        
            if selectedType == "Secret"
            {
            
              cell.TopicTitleView.text = t.title
              cell.TopicPictureImageView.image = t.picture
                
              cell.TopicUID = t.id
            
            }
            
            if selectedType == "Published"
            {
                
                cell.TopicTitleView.text = "published"
                cell.imageView!.image = nil
                
            }
            
            if selectedType == "Nearby"
            {
                
                cell.TopicTitleView.text = "nearby"
                cell.imageView!.image = nil
                
            }
            
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("NoTopicCell",forIndexPath: indexPath)
            
            return cell
            
        }
        
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   
    }
    
    
    //Conver images into base64 and keep them into string
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters )
        
        let decodedImage = UIImage(data: decodedData!)
        
        return decodedImage!
    }
    
    //Transmit the value to Reply View
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ReplySegue"
        {
           
            let  indexPath = self.tableView.indexPathForSelectedRow!.row
            
            let controller: ReplyViewController = segue.destinationViewController as! ReplyViewController
            
            let replyTopic: Topic = self.topicsList![indexPath] as! Topic
            
            controller.TopicUID = replyTopic.id!
            controller.TopicMessageNumber = replyTopic.message!
            
        }
        
    
        
        if segue.identifier == "FollowTopicsSegue"
        {
            
            let  indexPath = self.tableView.indexPathForSelectedRow!.row
            
            
            
            let followTopic: Topic = self.topicsList![indexPath] as! Topic
            
            
      
        }
        
      
        
    }
    
   
    //Save Topic Delegate
    func saveTopic(topic:Topic){
        
        
        
    }
    
   
    
}
