//
//  FavouriteTopicsCell.swift
//  DailyTopic
//
//  Created by Daniel on 8/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Firebase

class FavouriteTopicsCell: UITableViewCell {

    @IBOutlet weak var TopicImage: UIImageView!
    
    @IBOutlet weak var TopicTitle: UITextView!
    
    @IBOutlet weak var Messages: UILabel!
    
    @IBAction func UnsaveButton(sender: AnyObject) {
    }
    
    
}
