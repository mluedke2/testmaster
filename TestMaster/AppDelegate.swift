//
//  AppDelegate.swift
//  TestMaster
//
//  Created by Matt Luedke on 3/27/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window!.rootViewController = ViewController()
    window!.makeKeyAndVisible()
    
    return true
  }
}
