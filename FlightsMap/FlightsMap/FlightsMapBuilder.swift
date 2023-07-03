//
//  FlightsMapBuilder.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import FlightAPI

public final class FlightsMapBuilder {
    
    public static func make(service:AllStatesProtocol) -> FlightsMapController {
        let view = FlightsMapController()
        let router = FlightsMapRouter(view: view)
        let interactor = FlightsMapInteractor(service: service)
        let presenter = FlightsMapPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        return view
    }
}
