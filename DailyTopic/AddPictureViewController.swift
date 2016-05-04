//
//  AddPictureViewController.swift
//  DailyTopic
//
//  Created by Daniel on 4/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class AddPictureViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var returnCreateTopic: UIBarButtonItem!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func returnCreateTopicButton(sender: AnyObject) {
           self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraBtn(sender: UIBarButtonItem) {
        
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func libraryBtn(sender: AnyObject) {
    
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:"joker.jpg")
        imagePicker.delegate = self
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
}
