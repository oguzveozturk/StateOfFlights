//
//  MockFlightsMapRouter.swift
//  FlightsMapTests
//
//  Created by Oğuz Öztürk on 11.06.2023.
//

import XCTest
@testable import FlightsMap

final class MockFlightsMapRouter: FlightsMapRouterProtocol {
    
    var invokePresentRoute = false
    var invokePresentRouteCount = 0
    func present(route: FlightsMap.FlightsMapRoute) {
        invokePresentRoute = true
        invokePresentRouteCount += 1
    }
}
