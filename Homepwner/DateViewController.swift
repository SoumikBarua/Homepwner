//
//  DateViewController.swift
//  Homepwner
//
//  Created by SB on 11/26/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    var item: Item! {
        didSet {
            navigationItem.title = "Change date of \(item.name)"
        }
    }
    
    @IBOutlet var datePicker: UIDatePicker!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.datePickerMode = .date
        datePicker.setDate(item.dateCreated, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        item.dateCreated = datePicker.date
    }
}
