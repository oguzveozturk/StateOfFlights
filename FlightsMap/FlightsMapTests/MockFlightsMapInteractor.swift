//
//  MockFlightsMapInteractor.swift
//  FlightsMapTests
//
//  Created by Oğuz Öztürk on 11.06.2023.
//

import XCTest
import struct FlightAPI.Coordinates
@testable import FlightsMap

final class MockFlightsMapInteractor: FlightsMapInteractorProtocol {
    var delegate: FlightsMapInteractorDelegate?
    
    var invokeFetchAllPlanesParametersList = [(coordinates:FlightAPI.Coordinates,Void)]()
    func fetchAllPlanes(for coordinates: FlightAPI.Coordinates) {
        invokeFetchAllPlanesParametersList.append((coordinates: coordinates, ()))
    }
}
