//
//  WelcomeViewController.swift
//  DailyTopic
//
//  Created by Daniel on 3/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class WelcomeViewController: VideoSplashViewController {

    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBackground()
        
        LogInButton.layer.cornerRadius = 5
        CreateAccountButton.layer.cornerRadius = 5
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    func setupViewBackground()
    {
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("Background", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .Resize
        alwaysRepeat = true
        sound = false
        startTime = 0.0
        duration = 34
        alpha = 0.7
        
        contentURL = url
        
        
        
    }
    
}
