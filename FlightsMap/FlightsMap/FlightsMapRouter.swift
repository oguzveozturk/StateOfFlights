//
//  FlightsMapRouter.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import UIKit
import CounrtySelector

final class FlightsMapRouter: FlightsMapRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func present(route: FlightsMapRoute) {
        switch route {
        case .countrySelectorController(let delegate):
            view.present(CountrySelectorBuilder.make(delegate: delegate), animated: true)
        }
    }
}
