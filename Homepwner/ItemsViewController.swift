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
    
    
    @IBAction func addNewItem(_ sender: UIButton) {
        print("Came to addNewItem method")
        
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        print("Came to toggleEditingMode method")
        
        // If we are currently in editing mode ...
        if isEditing {
            // Change text of the button to inform user of the state
            sender.setTitle("Edit", for: .normal)

            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of the button to inform user of the state
            sender.setTitle("Done", for: .normal)

            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // If the tableView is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Remove \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: {
                (action) -> Void in
                
                //Remove the item from the store
                self.itemStore.removeItem(item)
                
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        // This is for changing the title of the red delete button that appears to the right of the row
        return "Remove"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        

        let item = itemStore.allItems[indexPath.row]
            
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
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
