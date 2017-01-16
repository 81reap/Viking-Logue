//
//  MainViewController.swift
//  Viking Logue
//
//  Created by Prayag Bhakar on 1/16/17.
//  Copyright © 2017 Prayag Bhakar. All rights reserved.
//

import Foundation

class MainViewController: UITableViewController {
    
    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var viewNum = Int()
    var menuItems =  ["All","News","Features","A&E","Sports","Forum","Viking Voice","Humans of Fremd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.title = menuItems[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
