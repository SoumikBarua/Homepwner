# Homepwner

This is an iOS app for adding and deleting items in a list view and modifying the contents of the item. The app also offers loading and saving between runs.

## Getting Started

This app was created to learn about **UITableView** and the necessary **UITableViewDataSource** and **UITableViewDelegate** methods. A nested **UIStackView** is also implemented that provides the option of taking pictures with **UIImagePickerController**. The table view and the stack view controllers are embedded in a **UINavigationController**. The key concept of an app's life cycle was also introduced. The app also dives into data persistence by saving with **NSKeyedArchiver** and loading with **NSKeyedUnArchiver**.

## App Walkthrough GIF

This GIF show the app in action (adding items, editing items, reordering items, preventing reordering past the last cell, deleting items, adding more items, tapping on a row to modify item details such as the date of creation, adding an image and changing the name, quitting and rerunning the app to showcase data persistence, deleting a photo of an item, quitting and rerunning the app to reflect deleted image). 

![Homepwner Walkthrough](walkthrough.gif)

## Lessons Learned
1. An app's life cycle consists of the different states that it transitions through. These states are **not running**, **active**, **inactive**, **background** and **suspended**. Here is a table that highlight the characteristics of these states:

   | State           | Visible          | Receives events  | Executes Code |
   | :------------: | :-------------:| :------------------: |:-----------------: |
   | Not running | No               | No                        | No                     |
   | Active          | Yes              | Yes                       | Yes                    |
   | Inactive       | Mostly         | No                        | Yes                    |
   | Background| No               | No                        | Yes                    |
   | Suspended | No               | No                        | No                     |
   
   All of these states are handled by the **UIApplicationDelegate** protocol methods in a typical **AppDelegate.swift**.
2. To simply display a list of items, people or books, **UITableView** comes in very handy as it shows data in a column split up into many rows.
3. A **UITableView** needs a view controller, a delegate and a data source, and all of these roles could be fulfilled by a **UITableViewController**. The **view** property of a **UITableViewController** object is an instance of **UITableView** by default.
4. If not using an instance of **UITableViewController**, any other instance of a type could fulfill the role of a data source as long as it conforms to **UITableViewDataSource** protocol. Similarly, any other instance of a type could fulfill the role of a delegate as long as it conforms to **UITableViewDelegate** protocol.
5. **UITableViewDataSource** protocol dictates that any instance conforming to this protocol must implement the two following methods: **tableView:numberOfRowsInSection:** and **tableView:cellForRowAtIndexPath:**. The first tells the data source the number of rows in a given section of the table view and the second asks the data source for a cell for a particular row.
6. **NSObject** is the base class that most classes in Objective-C inherit from. In fact, all the **UIKit** classes, such as **UIView**, **UIButton** etc., all directly or indirectly come from **NSObject**.
7. Classes in **Swift** have two types of initializers: i) *designated initializer* and ii) *convenience initializer*. 
8. A *designated initializer* is the primary initalizer of the class and every class must have one. This initializer also calls on a designated initializer, if it exists, of the superclass.
9. A *convenience initializer* is sort of a helper initializer and it is optional. This type of initializer is indicated by the **convenience** keyword and calls on another initializer of the same class.
10. If a class does NOT inherit from any other class, it is known as a *base class*. As a result, it will not have any of the features that **NSObject** affords.
11. Adding a **@discardableResult** keyword in front of a method with a return value allows the caller of that method to ignore the returned value.
12. *Dependency Inversion Principle* is the concept of decoupling objects in an application by inverting dependencies between them with the use of an abstraction. The principle states that:
> 1. High-level objects should not depend on low-level objects. Both should depend on abstraction.
> 2. Abstractions should not depend on details. Details should depend on abstractions.
13. *Dependency injection* is the common approach to implementing the dependency inversion principle. Since higher-level objects should not assume which lower-level objects they need, any lower-level objects needed are passed through an initializer or a property.
14.  A **UITableViewCell** instance itself has one subview, which is it's **contentView**. An additional subview, **accessoryView**, may also be present to display an action-oriented icon, such as a checkmark, an arrow etc.
15. The **contentView** of a **UITableViewCell** has three subviews. They are: i) **textLabel**, ii) **detailTextLabel** and iii) **imageView**. The use of these views could be modified with the four cases of the **UITableViewCellStyle** enum.
16. Reusing an instance of **UITableViewCell** with the help of **reuseIdentifier** property can conserve memory and improve performance. Reusing a cell means that more instances of **UITableViewCell** do not need to be created and the same cell can be used multiple times by changing its content. By convention, the **reuseIdentifier** is the same as the name of the cell class.
17. Once a cell class has been registered with its **reuseIdentifier**, an instance of that cell type can be dequeued from the pool of cells available for resue. To dequeue, use the **dequeueReusableCellWithIdentifier:** method on the **UITableView** instance.
18. To configure selection, reordering, responding to row actions, custom header/footer etc. use the delegate methods from the **UITableViewDelegate** protocol.
19. The **UITableView** class has an **isEditing** boolean property that allows an instance to enter editing mode for deleting and reordering rows etc. Interestingly,**UIViewController** also class has a **isEditing** property. So, any **UIViewController** that contains an editable view, such as a **UITableView**, will set the **isEditing** property of that editable view to match its own **isEditing** property.
20. To add rows to a **UITableView** instance, use the **insertRowsAtIndexPaths:withRowAnimation:** method. To delete rows, use the **deleteRowsAtIndexPaths:withRowAnimation:** instance method. Make sure insertion and deletion handles updating the data source so that the number of rows to be presented after addition or deletion is in sync.
21. Use **UIAlertController** class to present alerts or to display important information. Pick from the two **UIAlertControllerStyle** enum cases: **.alert** for critical alert and **.actionSheet** for presenting non-critical action or information.
22. To present a view controller modally, call the **present(_:animated:completion:)** on the **UIViewController** instance whose view is on the screen.
23. If a user changes the preferred text size in the **Settings** of the user's device, to reflect the user's choice, set the **adjustsFontForContentSizeCategory** boolean property  to **true** on the desired instances of **UILabel**. Perform this operation in the **awakeFromNib()** method of the view object that the desired **UILabel** instances are a part of. This method gets called when an object is loaded from an archive like a **Main.Storyboard** file. This is known as supporting **Dynamic Type**.
24. Using **UIStackView** instances are very helpful for any display content that needs to be set up in a linear fashion, like a bunch of text fields for a form. With nested stack views, a relatively simple and clean interface could be created pretty fast.
25. As learned previously, *intrinsic content size* refers to the size that a view wants to be, such as a text field having the size of the text to be shown. A *intrinsic content size* is based on the implicit constraints that are derived from a view object's *content hugging priorities* and *compression resistance priorities*.
26. There are *content hugging priorities* for each axis: vertical and horizontal. *Content hugging priorities* of a view object refers to how much likely it will stick to its size instead of getting bigger/stretched (think of a rubber band). This priority is associated with a value from 0 to 1000, with 1000 meaning it cannot be any larger than the intrinsic content size.
27. Similarly, there are two *compression resistance priorities*: vertical and horizontal. *Compression resistance priorities* of a view object refers to how much likely it will stick to its size instead of shrinking/getting smaller.
28. If there are two subviews in a superview, the subview with the greater value for a priority will resist any changes in size whenever the superview's dimensions changes.
29. **UIStackView** objects have a **distribution** property that can dictate how the elements inside the particular stack view are laid out. For example, the **fillEqually** case of the **UIStackView.Distribution** would ignore the intrinsic content sizes of the internal elements and resize them to have the same height or width depending on a vertical or a horizontal stack view, respectively.
30. To change the orientation of an existing **UIStackView** object in **Main.Storyboard**, simply change the **Axis** in its attributes inspector.
31. Segues are a great way of presenting new views and are represented by the **UIStoryboardSegue** class. To set up a segue, simply Control-drag from the object that triggers the segue, such as a button, to the view controller to be presented and then select Show from the Selection Segue section. NOTE: **UIStoryboardSegue** objects are components of storyboards. Without a storyboard, segue implementions will be different.
32. Segues have a *style*, an *action item*, and an *identifier*. The *style* refers to how the view controller will be presented while the *action item* refers to the object that will trigger the segue, such as a button. The *identifier* will be used to programmatically refer to and work with the segue.
33. Once the *identifier* of a segue has been set in the **Main.Storyboard**, to programmatically pass data, implement **prepare(for:sender:)** method to create an instance of the view controller to be displayed and pass relevant model object data to it. In this method, use the **identifier** of the segue in **switch** statement to see if the triggered segue is the desired segue. Make sure to use the **default:** case since switch expressions in **Swift** must be exhaustive either explicitly or via **default:**.
34. To implement a drill down interface like the **Settings** application of the device, using **UINavigationController** instances. An instance of **UINavigationController** maintains an array of view controllers and whichever one is on top of the stack, its **view** is visible.
35. The first view controller added to a **UINavigationController** object automatically becomes the "root view controller" and is placed at the bottom of the stack. Note that **UINavigationController**s do NOT have a **rootViewController** property like the app's **UIWindow** singleton. On the other hand, there IS a **topViewController** property for **UINavigationController**s that points to the view controller whose **view** is currently being displayed.
36. If a view controller is a part of a **UINavigationController**, then its **view** will have padding added to the top to adjust for the navigation bar.
37. If a **UITableView** instance row had it's content updated, call **reloadData()** on the instance. For example, if a item's details were changed and the user went back to the table view, to reflect the changes. call **reloadData()** in the **viewWillAppear()** method of the view controller with the table view.
38. To dismiss a keyboard when the Return key is pressed, simply use the **textFieldShouldReturn(_:)** method from the **UITextFieldDelegate** protocol and call the **resignFirstResponder()** on the text field and return **true**.
39. If there are multiple text fields, to dismiss the keyboard, use a **UITapGestureRecognizer** on the background of the view and establish a target-action pair as learned before. Simply calling `view.endEditing(true)`  in the action method will dismiss the keyboard regardless of which text field was active.
40. The **UINavigationBar** of a **UINavigationController** uses the **navigationItem** property of the top view controller on the stack to configure itself. For example. `navigationItem.title = "Homepwner"` in a view controller would set the title of the **UINavigationBar** instance of any **UINavigationController** as Homepwner.
41. While the **UINavigationBar** is a type of **UIView**, the **navigationItem** property of view controllers that it uses is NOT a subclass of **UIView**.
42. Similarly, buttons that could be added to a **UINavigationBar** instance are of type **UIBarButtonItem**, NOT **UIView**. To give a default appearance, initialize the instance of **UIBarButtonItem** using **init(barButtonSystemItem:target:action:)** with the different cases, such as camera, of the **UIBarButtonItem.SystemItem** enum. This can also be changed in the attributes inspector in **Main.Storyboard** file.
43. The **editButtonItem** is an instance property of the **UIViewController** class that creates a **UIBarButtonItem** with the title Edit when added as a navigation bar button item. This can also call the **setEditing(_:animated:)** on its view controller and consequently set the **isEditing** boolean property on an editable view, such as a **UITableView**, that the view controller manages.
44. The **UIImageView** class is used to display images to the user. To maintain the aspect ratio of an image within the bounds of the image view, set its **contentMode** property to **.scaleAspectFit** case of **UIView.ContentMode** enum.
45. A **UIToolbar** is similar to **UINavigationBar** in that instances of **UIBarButtonItem** are added to it. However, while a **UINavigationBar** instance will only allow two bar button items, an array of such items could be added to an instance of **UIToolbar**.
46. The **UIImagePickerController** class is useful for providing a way for the user to pick images whether using a camera or picking a saved photo. To use an instance, which source is available using the static **isSourceTypeAvailable(_:)** method and setting the view controller presenting the instance the delegate.
47. A lot of device capabilities require the permission of the user before usage: camera, location, microphone etc. To use these features, appropriate usage description key must be added to the list of Custom iOS Target Properties in the project settings or to the Info.plist file (Custom iOS Target Properties is based on the Info.plist file). For example, to use the camera feature, the keys **NSCameraUsageDescription** and **NSPhotoLibraryUsageDescription** must be added with corresponding values.
48. Since image files tend be large in nature, it is a good practice to handle them separately and cache them. The **NSCache** class can be used for caching purposes and it works very much like a dictionary, except it removes objects automatically when the system is low on memory. A **NSCache** instance can add, remove and get values using the **setObject(_:forKey:)**, **removeObject(forKey:)**, and **object(forKey:)** methods, respectively. Since keys need to be unique, accessing the **uuidString** property of the **UUID** structure will provide a universally unique identifier string.
49. *Archiving* and *unarchiving* is one of the ways to implement data persistence in iOS apps. Archiving an object involves recording all of its properties and saving them to the filesystem while unarchiving recreates the object from that. Model objects that need to be saved and loaded must conform to **NSCoding** protocol. In the conforming object, the protocol requires the implementation of **encode(with:)** to encode the object's properties with the given archiver and **init(coder:)** to load the object from data in given unarchiver. Note: encoding is a recursive process.
50. The *application sandbox* of an application is the directory that is separate from the rest of the filesystem. 
   `Documents/` is where important data generated during runtime is kept and is synced with iTunes or iCloud. Any file with data that needs to persist lives here.  
   `Library/Caches/` is where large data from runtime is kept. This persists between runs; however, due to its size, it is not synced.  
   `Library/Preferences/` is where any user preferences are saved and also where the device's Settings applications looks for app preferences. It is synced with iTunes or iCloud and handled by the **NSUserDefaults** class.  
   `tmp/` is where for any file written temporarily during the execution of the app. Files here will be deleted whenever the app is not running and obviously not backed up.  
51. Error handling in **Swift** involves a method indicating a potential error with the **throws** keyword in its method signature. To call a method that can throw, the caller must implement a `do-catch` statement and use the **try** keyword before any method potentially throwing errors.

## License

    Copyright 2019 Soumik Barua

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
