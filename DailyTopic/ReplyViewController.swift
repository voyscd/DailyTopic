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
    var TopicMessageNumber: Int?
    
    
    @IBOutlet weak var ReplyTitleLabel: UITextView!
    
    @IBOutlet weak var ReplyPictureImageView: UIImageView!
    
    @IBOutlet weak var ReplyMessageTextView: UITextView!
    
    
    @IBAction func BackHomeButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    
    @IBAction func PostRelyButton(sender: AnyObject) {
        
        let ref = Firebase(url: "https://dailytopic-daniel.firebaseio.com/DailyTopic/TotalTopics/Secret/\(TopicUID!)")
        
        //Save the Topic Message Comment
        let topic = ref.childByAppendingPath("MessagesComment")
        
        let message = ReplyMessageTextView.text!
        
        print("Message:\(message)")
        
        topic.childByAutoId().setValue(message)
        
        //Save the Topic Message Count
        let MessageCount = TopicMessageNumber! + 1
        print(TopicMessageNumber!)
        
        ref.childByAppendingPath("MessagesCount").setValue(MessageCount)
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subView in self.ReplyMessageTextView.subviews
        {
            for subsubView in subView.subviews
            {
                if let textField = subsubView as? UITextField
                {
                    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Leave a Message", comment: ""),attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
                    
                    textField.textColor = UIColor.redColor()
                }
            }
        }
        
    }
    
    
    public func textViewShouldEndEditing(textView: UITextView) -> Bool
    {
        return true
    }
    
    
    
    
    
}
