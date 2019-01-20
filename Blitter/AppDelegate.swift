//
//  AppDelegate.swift
//  Blitter
//
//  Created by Richard Adem on 19/1/19.
//  Copyright © 2019 Richard Adem. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    window = UIWindow(frame: UIScreen.main.bounds)
    if let window = window {
      let viewController = MainViewController()
      window.rootViewController = viewController
      window.backgroundColor = UIColor.white
      window.makeKeyAndVisible()
    }
    
    return true
  }


}

