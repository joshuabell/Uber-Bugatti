//
//  AppDelegate.swift
//  Uber Bugatti
//
//  Created by Joshua Bell on 3/1/16.
//  Copyright © 2016 Joshua Bell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        launchUberApp( application )
        return true
    }

    func applicationWillEnterForeground(application: UIApplication) {
        self.launchUberApp( application )
    }
    
    func launchUberApp( application: UIApplication ) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
        dispatch_after( delayTime, dispatch_get_main_queue()) {
            let uberAppURL = NSURL.init( string:"uber://")
            if application.canOpenURL(uberAppURL!) {
                application.openURL(uberAppURL!)
            } else {
                let uberWebURL = NSURL.init( string:"https://www.uber.com")
                application.openURL( uberWebURL! )
            }
        }
    }

}

