//
//  AppDelegate.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Registering for a local notification service.

        self.registerForUserLocalNotificationWithApplication(application)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func registerForUserLocalNotificationWithApplication(application: UIApplication){
    
        let notificationForegroudAction = UIMutableUserNotificationAction()
        notificationForegroudAction.activationMode = .Foreground
        notificationForegroudAction.destructive = false
        notificationForegroudAction.title = "customer care"
        notificationForegroudAction.authenticationRequired = false
        
        let notificationBackgroundAction = UIMutableUserNotificationAction()
        notificationBackgroundAction.activationMode = .Background
        notificationBackgroundAction.destructive = false
        notificationBackgroundAction.title = "customer disturbance :)"
        notificationBackgroundAction.authenticationRequired = false
        
        var notificationCategory = UIMutableUserNotificationCategory()
        notificationCategory.identifier = "Bob_Actions"
        notificationCategory.setActions([notificationForegroudAction, notificationBackgroundAction], forContext: .Default)
        let notificationCategories:NSSet = NSSet(object: notificationCategory)
        let notificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
        let notificationSettings = UIUserNotificationSettings(forTypes: notificationType, categories: notificationCategories as Set<NSObject>)
        
        application.registerUserNotificationSettings(notificationSettings)
    }
}

