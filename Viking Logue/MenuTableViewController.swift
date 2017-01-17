//
//  MenuTableViewController.swift
//  Viking Logue
//
//  Created by Prayag Bhakar on 1/16/17.
//  Copyright © 2017 Prayag Bhakar. All rights reserved.
//

import Foundation

class MenuTableViewController: UITableViewController {
    
    var menuItems = [String]()
    
    override func viewDidLoad() {
        menuItems = ["All","News","Features","A&E","Sports","Forum","Viking Voice","Humans of Fremd"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = menuItems[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let endViewController = segue.destination as! MainViewController
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        endViewController.viewNum = indexPath.row
        
    }
    
}
