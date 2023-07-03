//
//  AppContainer.swift
//  StateOfFlights
//
//  Created by Oğuz Öztürk on 8.06.2023.
//

import Foundation
import FlightAPI

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = Network()
}

