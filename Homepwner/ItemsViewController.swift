//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by SB on 9/23/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    var moreThan50: [Item]!
    var theRest: [Item]!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section is \(section)")
        var rowCount: Int = 0
        
        if section == 0 {
            rowCount = moreThan50.count + 1
        } else if section == 1 {
            rowCount = theRest.count + 1
        }
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creating an instance of UITableViewCell with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        if indexPath.section == 0 {
            print("indexPath.row \(indexPath.row)")
            
            if indexPath.row < moreThan50.count {
                let item = moreThan50[indexPath.row]
                
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
                
            } else {
                cell.textLabel?.text = "No more items!"
                cell.detailTextLabel?.text = "End of More than 50 list"
            }
        }
        else if indexPath.section == 1 {
            
            if indexPath.row < theRest.count {
                let item = theRest[indexPath.row]
                
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
                
            } else {
                cell.textLabel?.text = "No more items!"
                cell.detailTextLabel?.text = "End of The Rest list"
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerString = String()
        if section == 0 {
            headerString = "More than 50"
        }
        else if section == 1 {
            headerString = "The Rest"
        }
        return headerString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset =  insets
        tableView.scrollIndicatorInsets = insets
    }
}

