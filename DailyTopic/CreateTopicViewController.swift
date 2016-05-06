//
//  CreateTopicViewController.swift
//  DailyTopic
//
//  Created by Daniel on 30/04/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton
import Firebase

var cells = [LiquidFloatingCell]()  //DataSource
var imagePicker = UIImagePickerController()


class CreateTopicViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{

    
    @IBOutlet weak var topicTextfield: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func CreateTopicButton(sender: AnyObject) {
        
        
        let authData = CURRENT_USER.authData.description.componentsSeparatedByString(" ")
        
        let uid = authData[1]
        
        var ref = Firebase(url: "https://dailytopic-daniel.firebaseio.com/DailyTopic/Users")
        
        var topic = ref.childByAppendingPath(uid + "/Topic").setValue(topicTextfield.text)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
var floatingActionButton: LiquidFloatingActionButton!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
         imagePicker.delegate = self
          topicTextfield.delegate = self
        createFloatingButtons()
        
      
        
        
    }
    
    
    // MARK: - Create floating buttons
    
    private func createFloatingButtons()
    {
    
        cells.append(createButtonCell("Camera"))
        cells.append(createButtonCell("library"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 260,y: self.view.frame.height - 56 - 80, width: 56 , height: 56)
        let floatingButton = createButton(floatingFrame,style: .Up)
        
        self.view.addSubview(floatingButton)
        self.floatingActionButton = floatingButton
        
    }
    
    private func createButtonCell(iconName: String) -> LiquidFloatingCell
    {
        return LiquidFloatingCell(icon: UIImage(named: iconName)!)
    }
    
    private func createButton(frame: CGRect,style: LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton
    {
        let floatingActionButton = LiquidFloatingActionButton(frame: frame)
        
        floatingActionButton.animateStyle = style
        floatingActionButton.dataSource = self
        floatingActionButton.delegate = self
        
        return floatingActionButton
    }
    
    
   
    
    func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }

    

}



extension UIViewController: LiquidFloatingActionButtonDataSource
{
     public func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int
    {
        return cells.count
    }
    
     public func cellForIndex(index: Int) -> LiquidFloatingCell
    {
        return cells[index]
    }
}



extension UIViewController: LiquidFloatingActionButtonDelegate
{
   public func liquidFloatingActionButton(liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int)
       {
        print("button number \(index) did click")
    
        if index == 0
        {
         
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        if index == 1
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        

        
    }
}




