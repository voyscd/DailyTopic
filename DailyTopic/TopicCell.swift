//
//  TopicCell.swift
//  DailyTopic
//
//  Created by Daniel on 7/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase
protocol saveTopicDelegate{
    func saveTopic(topic:Topic)
}


class TopicCell: UITableViewCell {

    @IBOutlet weak var TopicTitleView: UITextView!
    @IBOutlet weak var TopicMessageLabel: UILabel!
    @IBOutlet weak var TopicPictureImageView: UIImageView!
    var TopicUID: String?
    var TopicTitle: String?
    var TopicType: String?
    var TopicP: UIImage?
    var tapBlock: dispatch_block_t?
    
    @IBOutlet weak var ReplyButton: UIButton!
    
    @IBAction func ReplyButton(sender: AnyObject) {
        
     
        
        
    }
    
    @IBAction func SaveButton(sender: AnyObject) {
        
        //Get Current User ID
        let authData = CURRENT_USER.authData.description.componentsSeparatedByString(" ")
        
        let uid = authData[1]
        
        let ref = Firebase(url: "https://dailytopic-daniel.firebaseio.com/DailyTopic/Users")
        
        let favourteTopic = ref.childByAppendingPath(uid + "/Favourite/" + TopicUID!)
        
        
        
        
        
        
        
    }
    
    
    
}
