//
//  CreateTopicViewController.swift
//  DailyTopic
//
//  Created by Daniel on 30/04/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton


class CreateTopicViewController: UIViewController {

    var cells = [LiquidFloatingCell]()  //DataSource
    var floatingActionButton: LiquidFloatingActionButton!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        createFloatingButtons()
        
        
    }
    
    
    // MARK: - Create floating buttons
    
    private func createFloatingButtons()
    {
        cells.append(createButtonCell("add"))
        cells.append(createButtonCell("camera"))
        cells.append(createButtonCell("library"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16,y: self.view.frame.height - 56 - 10, width: 56 , height: 56)
        let floatingButton = createButton(floatingFrame,style: .Up)
        
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
    }
}




