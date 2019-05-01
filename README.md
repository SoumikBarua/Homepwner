# Homepwner

This is an iOS app for adding and deleting items in a list view and modifying the contents of the item. The app also offers loading and saving between runs.

## Getting Started

This app was created to learn about **UITableView** and the necessary **UITableViewDataSource** and **UITableViewDelegate** methods. A nested **UIStackView** is also implemented that provides the option of taking pictures with **UIImagePickerController**. The table view and the stack view controllers are embedded in a **UINavigationController**. The app also dives into data persistence by saving with **NSKeyedArchiver** and loading with **NSKeyedUnArchiver**.

## App Walkthrough GIF

This GIF show the app in action (adding items, editing items, reordering items, preventing reordering past the last cell, deleting items, adding more items, tapping on a row to modify item details such as the date of creation, adding an image and changing the name, quitting and rerunning the app to showcase data persistence, deleting a photo of an item, quitting and rerunning the app to reflect deleted image). 

![Homepwner Walkthrough](walkthrough.gif)

## Lessons Learned
1. To simply display a list of items, people or books, **UITableView** comes in very handy as it shows data in a column split up into many rows.
2. A **UITableView** needs a view controller, a delegate and a data source, and all of these roles could be fulfilled by a **UITableViewController**. The **view** property of a **UITableViewController** object is an instance of **UITableView** by default.
3. If not using an instance of **UITableViewController**, any other instance of a type could fulfill the role of a data source as long as it conforms to **UITableViewDataSource** protocol. Similarly, any other instance of a type could fulfill the role of a delegate as long as it conforms to **UITableViewDelegate** protocol.
4. **UITableViewDataSource** protocol dictates that any instance conforming to this protocol must implement the two following methods: **tableView:numberOfRowsInSection:** and **tableView:cellForRowAtIndexPath:**. The first tells the data source the number of rows in a given section of the table view and the second asks the data source for a cell for a particular row.
5. **NSObject** is the base class that most classes in Objective-C inherit from. In fact, all the **UIKit** classes, such as **UIView**, **UIButton** etc., all directly or indirectly come from **NSObject**.
6. Classes in **Swift** have two types of initializers: i) *designated initializer* and ii) *convenience initializer*. 
7. A *designated initializer* is the primary initalizer of the class and every class must have one. This initializer also calls on a designated initializer, if it exists, of the superclass.
8. A *convenience initializer* is sort of a helper initializer and it is optional. This type of initializer calls on another initializer of the same class and is indicated by the **convenience** keyword.
9. If a class does NOT inherit from any other class, it is known as a *base class*. As a result, it will not have any of the features that **NSObject** affords.
10. Adding a **@discardableResult** keyword in front of a method with a return value allows the caller of that method to ignore the returned value.
11. *Dependency Inversion Principle* is the concept of decoupling objects in an application by inverting dependencies between them with the use of an abstraction. The principle states that:
> 1. High-level objects should not depend on low-level objects. Both should depend on abstraction.
> 2. Abstractions should not depend on details. Details should depend on abstractions.
12. *Dependency injection* is the common approach to implementing the dependency inversion principle. Since higher-level objects should not assume which lower-level objects they need, any lower-level objects needed are passed through an initializer or a property.
13.  A **UITableViewCell** instance itself has one subview, which is it's **contentView**. An additional subview, **accessoryView**, may also be present to display an action-oriented icon, such as a checkmark, an arrow etc.
14. The **contentView** of a **UITableViewCell** has three subviews. They are: i) **textLabel**, ii) **detailTextLabel** and iii) **imageView**. The use of these views could be modified with the four cases of the **UITableViewCellStyle** enum.
15. Reusing an instance of **UITableViewCell** with the help of **reuseIdentifier** property can conserve memory and improve performance. Reusing a cell means that more instances of **UITableViewCell** do not need to be created and the same cell can be used multiple times by changing its content. By convention, the **reuseIdentifier** is the same as the name of the cell class.
16. Once a cell class has been registered with its **reuseIdentifier**, an instance of that cell type can be dequeued from the pool of cells available for resue. To dequeue, use the **dequeueReusableCellWithIdentifier:** method on the **UITableView** instance.
17. To configure selection, reordering, responding to row actions, custom header/footer etc. use the delegate methods from the **UITableViewDelegate** protocol.
18. The **UITableView** class has an **editing** boolean property that allows an instance to enter editing mode for deleting and reordering rows etc.
19. To add rows to a **UITableView** instance, use the **insertRowsAtIndexPaths:withRowAnimation:** method. To delete rows, use the **deleteRowsAtIndexPaths:withRowAnimation:** instance method. Make sure insertion and deletion handles updating the data source so that the number of rows to be presented after addition or deletion is in sync.
20. Use **UIAlertController** class to present alerts or to display important information. Pick from the two **UIAlertControllerStyle** enum cases: **.alert** for critical alert and **.actionSheet** for presenting non-critical action or information.
21. To present a view controller modally, call the **present(_:animated:completion:)** on the **UIViewController** instance whose view is on the screen.
22. If a user changes the preferred text size in the **Settings** of the user's device, to reflect the user's choice, set the **adjustsFontForContentSizeCategory** boolean property  to **true** on the desired instances of **UILabel**. Perform this operation in the **awakeFromNib()** method of the view object that the desired **UILabel** instances are a part of. This method gets called when an object is loaded from an archive like a **Main.Storyboard** file. This is known as supporting **Dynamic Type**.
