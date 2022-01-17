//
//  AppDelegate.swift
//  testmission
//
//  Created by Bao on 16/01/2022.
//


import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    static func sharedInstance() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
//        DropDown.startListeningToKeyboard()
        FirebaseApp.configure()
//        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        // Override point for customization after application launch.
        return true
    }


}

