//
//  AppRouter.swift
//  StateOfFlights
//
//  Created by Oğuz Öztürk on 8.06.2023.
//

import UIKit
import FlightsMap

final class AppRouter {
    var window: UIWindow?

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = FlightsMapBuilder.make(service: app.service)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
