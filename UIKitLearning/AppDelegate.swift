//
//  AppDelegate.swift
//  UIKitLearning
//
//  Created by Łukasz Sypniewski on 15/08/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var rootNavigationController = UINavigationController()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let firstView = FirstViewController(nibName: "FirstView", bundle: nil)
        rootNavigationController.pushViewController(firstView, animated: true)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()

        return true
    }
}

