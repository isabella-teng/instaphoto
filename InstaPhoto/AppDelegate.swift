//
//  AppDelegate.swift
//  InstaPhoto
//
//  Created by Isabella Teng on 6/26/17.
//  Copyright © 2017 Isabella Teng. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Parse initialization
        Parse.initialize(
            with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "Instaphoto"
                configuration.clientKey = "Turtle98" // set to nil assuming you have not set clientKey
                configuration.server = "https://shrouded-river-14118.herokuapp.com/parse"
            })
        )
        
        if let currentuser = PFUser.current() {
            //if there is a logged in user then load the home view controller
            print("Welcome back!")
            //load Chat view controller and set as root view controller
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
            window?.rootViewController = tabBarController as! UITabBarController
        } else {
            print("no logged in user")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            window?.rootViewController = loginViewController

        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("logoutNotification"), object: nil, queue: OperationQueue.main) { (Notification) in
            
            print("entered")
            
                // Take user to logout screen
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                self.window?.rootViewController = loginViewController
                //PFUser.logOutInBackground()
                
        }
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

