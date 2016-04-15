//
//  AppDelegate.swift
//  Example
//
//  Created by Heberti Almeida on 08/04/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit
import FolioReaderKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.updateDB(_:)), name: "updateFilePathNotificationKey", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.showInterstital), name: "showInterstitialOnReaderExitNotificationKey", object: nil)
        
        return true
    }
    
    func updateDB(notification: NSNotification) {
        let _: Dictionary<String, AnyObject> = notification.userInfo as! Dictionary<String, AnyObject>
    }
    
    func showInterstital() {
        let visibleViewController = getVisibleViewController()
        let className = NSStringFromClass(visibleViewController!.classForCoder).componentsSeparatedByString(".").last!
        
        debugPrint(className)
    }
    
    // Gets the visible view controller of application at any instant
    func getVisibleViewController() -> UIViewController? {
        var viewController = UIApplication.sharedApplication().keyWindow?.rootViewController
        var presentedViewController: UIViewController?
        repeat {
            presentedViewController = viewController?.presentedViewController
            if presentedViewController != nil {
                viewController = presentedViewController
            }
        } while (presentedViewController != nil)
        return viewController
    }
    

    func applicationWillResignActive(application: UIApplication) {
        FolioReader.applicationWillResignActive()
    }

    func applicationWillTerminate(application: UIApplication) {
        FolioReader.applicationWillTerminate()
    }


}

