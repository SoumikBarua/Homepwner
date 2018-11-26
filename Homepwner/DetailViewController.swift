//
//  DetailViewController.swift
//  Homepwner
//
//  Created by SB on 11/23/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nameField: CustomTextField!
    @IBOutlet var serialNumberField: CustomTextField!
    @IBOutlet var valueField: CustomTextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var trashBarButtonItem: UIBarButtonItem!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var imageStore: ImageStore!
    
    let numberFormatter: NumberFormatter = {
       let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }()
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        valueField.keyboardType = .numberPad
        
        // Get the item key
        let key = item.itemKey
        
        // If there is an associated image with the item, display it on the image view
        if let imageToDisplay = imageStore.image(forKey: key) {
            imageView.image = imageToDisplay
            trashBarButtonItem.isEnabled = true
        } else {
            trashBarButtonItem.isEnabled = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    /// Preparing for the change date button segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDate"?:
            let dateViewController = segue.destination as! DateViewController
            dateViewController.item = self.item
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    
    /// This is for camera bar button item action
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise, just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        // Allowing the user to edit the image
        imagePicker.allowsEditing = true
        
        // Place the image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    /// This is for image deletion bar button item
    @IBAction func removeImage(_ sender: UIBarButtonItem) {
        // Since this action was triggered, the item must have an image
        
        // Delete the image from the image store
        imageStore.deleteImage(forKey: item.itemKey)
        
        // Remove the image from the image view
        imageView.image = nil
        
        trashBarButtonItem.isEnabled = false
    }
    
    
    /// This is used to save the reference to the pickage image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Get picked/edited image from info dictionary
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forkey: item.itemKey)
        
        // Put that image on the screen in the image view
        imageView.image = image
        
        // Take image picker off the screen
        // Must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
}

class CustomTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.borderStyle = .bezel
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.borderStyle = .roundedRect
        return true
    }
}
