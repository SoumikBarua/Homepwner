//
//  AppDelegate.swift
//  Homepwner
//
//  Created by SB on 9/23/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create an ItemStore
        let itemStore = ItemStore()
        var moreThan50 = [Item]()
        var theRest = [Item]()
        
        for item in itemStore.allItems {
            //print("item.valueInDollars is \(item.valueInDollars)")
            if item.valueInDollars > 50 {
                moreThan50.append(item)
                //print("added to moreThan50")
            } else {
                theRest.append(item)
                //print("added to theRest")
            }
        }
        
        // Access the ItemsViewController and set its itemStore
        let itemsController = window!.rootViewController as! ItemsViewController
        itemsController.itemStore = itemStore
        itemsController.moreThan50 = moreThan50
        itemsController.theRest = theRest
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}