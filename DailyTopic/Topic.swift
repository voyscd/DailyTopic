//
//  Topic.swift
//  DailyTopic
//
//  Created by Daniel on 8/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class Topic: NSObject {

    var id:String?
    var title:String?
    var type:String?
    var picture: UIImage?
    var message: Int?
    
    init(newID:String,newTitle:String,newType:String,newPicture:UIImage,newMessageCount:Int)
    {
        id = newID
        title = newTitle
        type = newType
        picture = newPicture
        message = newMessageCount
        
    }
    
}
