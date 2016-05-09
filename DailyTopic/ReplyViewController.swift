//
//  ReplyViewController.swift
//  DailyTopic
//
//  Created by Daniel on 9/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class ReplyViewController: UIViewController,UITextViewDelegate{

    
    
    var TopicUID : String?
    
    
    @IBOutlet weak var ReplyTitleLabel: UITextView!
    
    @IBOutlet weak var ReplyPictureImageView: UIImageView!
    
    @IBOutlet weak var ReplyTitleTextView: UITextView!
    
    
    @IBAction func BackHomeButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    
    @IBAction func PostRelyButton(sender: AnyObject) {
        
        let ref = Firebase(url: "https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret/\(TopicUID!)")
        let topic = ref.childByAppendingPath("Messages")
        
        let message = ReplyTitleTextView.text!
        
        topic.childByAutoId().setValue(message)
        
         self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    public func textViewShouldEndEditing(textView: UITextView) -> Bool
    {
        return true
    }
    
    
    
    
    
}
