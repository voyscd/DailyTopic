//
//  SearchViewController.swift
//  DailyTopic
//
//  Created by Daniel on 4/05/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate{

    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        SearchBar.delegate = self
    }
    
    
 
    
    
    
    
    func searchBarDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
 
    func searchBarShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
    
}
