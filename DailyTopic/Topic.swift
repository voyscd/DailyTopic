//
//  Topic.swift
//  DailyTopic
//
//  Created by Daniel on 8/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class Topic: NSObject {

    var title:String?
    var type:String?
    var picture: UIImage?
    
    init(newTitle:String,newType:String,newPicture:UIImage)
    {
        title = newTitle
        type = newType
        picture = newPicture
    }
    
}
