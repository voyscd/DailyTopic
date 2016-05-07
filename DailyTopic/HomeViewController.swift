//
//  HomeViewController.swift
//  DailyTopic
//
//  Created by Daniel on 7/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var secretType = "Secret"
    var publishedType = "Published"
    var nearbyType = "Nearby"
    var selectedType = ""
    var topicsList : NSMutableArray
    
    required init?(coder aDecoder: NSCoder)
    {
        self.topicsList = NSMutableArray()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var tableview: UITableView!

    
    @IBAction func segmentedAction(sender: UISegmentedControl) {
       selectedType = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
       loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        
        if selectedType == "Secret"
        {
            
        }
        
        tableview.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell",forIndexPath: indexPath) as! TopicCell
        
        print(selectedType)
        
        if selectedType == "Secret"
        {
            print("Secret")
            cell.TopicTitle.text = "secret"
     
        }
        
        if selectedType == "Published"
        {
            print("Published")
            cell.TopicTitle.text = "published"
    
        }
        
        if selectedType == "Nearby"
        {
            print("Nearby")
            cell.TopicTitle.text = "nearby"

        }
        
        
        
        return cell
    }
    
    
    
    
}
