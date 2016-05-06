//
//  LoginViewController.swift
//  DailyTopic
//
//  Created by Daniel on 30/04/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import Foundation
import Firebase



class LoginViewController: VideoSplashViewController,UITextFieldDelegate{

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var logoutButton: UIButton!
    
    
    @IBOutlet weak var CancelButton: UIButton!
    
    @IBAction func CancelButtonAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
 
       CancelButton.layer.cornerRadius = 5
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
  
    
 
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.logoutButton.hidden = true
        
//        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil
//        {
//            self.logoutButton.hidden = false
//        }
    }
    
    
    @IBAction func loginAction(sender: AnyObject) {
        
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        
        let bounds = self.loginButton.bounds
        
        //Animate
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.enabled = false
            
            }, completion: { finished in self.loginButton.enabled = true })
        
        if email != "" && password != ""
        {
            FIREBASE_REF.authUser(email,password:password,withCompletionBlock: { (error,authData) -> Void in
                if error == nil{
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid,forKey: "uid")
                    
                    //Sucessful Login
                    print("Logged In :)")
                    self.logoutButton.hidden = false
                    
                   
                    
                    
                    
                    
                }
                else{
                    print(error)
                    
                    let alert = UIAlertController(title: "Email or Password is not correct",message:"Please Check it Again",preferredStyle: .Alert)
                    
                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alert.addAction(action)
                    
                    self.presentViewController(alert, animated: true, completion: nil)

                    
                }
            })
        }else
        {
            let alert = UIAlertController(title: "Error",message:"Enter Email and Password.",preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
   
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
     }
    
    @IBAction func logoutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        self.logoutButton.hidden = true
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
}










