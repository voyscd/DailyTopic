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
    var topicsList : NSArray?
 
    
    
    required init?(coder aDecoder: NSCoder)
    {
        self.topicsList = [Topic]()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var tableview: UITableView!

    
    @IBAction func segmentedAction(sender: UISegmentedControl) {
       selectedType = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
       tableview.reloadData()
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
                
                let topic = Topic(newTitle: topicTitle, newType: topicType, newPicture: topicImage)
                
               newItems.append(topic)
            
            }
            
            self.topicsList = newItems
            self.tableview.reloadData()
        })
    
        
    }
  
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return self.topicsList!.count
        
        print("TopicsList:\(self.topicsList!.count)")
 
    
       // return 1
        
        
        
//        if selectedType == "Secret"
//        {
//            
//            let firebase = Firebase(url:"https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret")
//            
//              UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//            
//            firebase.observeEventType(.Value, withBlock: { (snapshot: FDataSnapshot!) in
//                
//                if snapshot.exists(){
//                    rows = Int(snapshot.childrenCount)
//                    print("inner:\(rows)")
//                }else{
//                    rows = 1
//                }
//            })
//            
//              UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//        }
     
        
     
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell",forIndexPath: indexPath) as! TopicCell
            
            print("inner:\(topicsList!.count)")
            
//           let t:Topic = self.topicsList[indexPath.row] as! Topic
        
            
            
            if selectedType == "Secret"
            {
                
                let firebase = Firebase(url:"https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret")
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                
                firebase.observeEventType(.Value, withBlock: { snapshot in

                    
                    for item in snapshot.children{
                        let topicItem = item as! FDataSnapshot
                        
                        cell.TopicTitle.text = topicItem.value.objectForKey("TopicTitle") as! String
                        let base64String = topicItem.value.objectForKey("TopicPicture") as! String
                        
                        print(cell.TopicTitle.text)
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
        
        let decodedImage = UIImage(data: decodedData!)
        
        return decodedImage!
    }
    
   
    
   
    
}
