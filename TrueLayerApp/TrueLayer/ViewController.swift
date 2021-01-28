//
//  ViewController.swift
//  TrueLayer
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import UIKit
import TLList

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
     var listView : PokemonListView!
    override func viewDidLoad() {
    
        listView = PokemonListView.init()
        self.addChild(listView )
        let newView = listView.view
        newView?.translatesAutoresizingMaskIntoConstraints = false
        newView!.frame = self.view.frame
        self.view.addSubview(newView!)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}






