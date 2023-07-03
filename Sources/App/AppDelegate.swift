//
//  AppDelegate.swift
//  StateOfFlights
//
//  Created by Oğuz Öztürk on 8.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.router.start()
        return true
    }
}
