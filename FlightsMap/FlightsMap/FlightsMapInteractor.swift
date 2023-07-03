//
//  FlightsMapInteractor.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import FlightAPI

final class FlightsMapInteractor: FlightsMapInteractorProtocol {
    weak var delegate: FlightsMapInteractorDelegate?
    
    private let service:AllStatesProtocol!
    
    init(service:AllStatesProtocol) {
        self.service = service
    }
    
    func fetchAllPlanes(for coor: Coordinates) {
        service.getAllStates(coordinates: coor) { [weak self] response in
            switch response.result {
            case .success(let flightState):
                self?.delegate?.handleOutput(.showFlights(flightState.states))
            case .failure(let error):
                self?.delegate?.handleOutput(.showError(error))
            }
        }
    }
}
