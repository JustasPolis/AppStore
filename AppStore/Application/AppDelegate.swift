//
//  AppDelegate.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.makeKeyAndVisible()
            window.backgroundColor = .white
            Application.shared.configureMainInterface(in: window)
        }
        return true
    }
}
