//
//  FlightsMapPresenter.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import Common
import MapKit
import struct FlightAPI.Coordinates
import CounrtySelector

final class FlightsMapPresenter:NSObject, FlightsMapPresenterProtocol {
    
    var planes = [Plane]()
    var filteredPlanes: [Plane] = []
    var groupedPlanes: Dictionary<Country, [Plane]> = [:]
    var selectedCountry:Country?

    weak var delegate: CountriesDidLoadDelegate?
    weak var timer: Timer?

    private let interactor:FlightsMapInteractorProtocol!
    private let view:FlightsMapViewProtocol!
    private let router:FlightsMapRouterProtocol!
    
    init(view:FlightsMapViewProtocol!,
         interactor:FlightsMapInteractorProtocol!,
         router:FlightsMapRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
        super.init()
        self.interactor.delegate = self
    }

    func load() {
        view.setInitialRegion()
        router.present(route: .countrySelectorController(self))
    }
    
    func regionChange(_ coordinates: Coordinates) {
        view.showIndicator()
        interactor.fetchAllPlanes(for: coordinates)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] _ in
            self?.view.showIndicator()
            self?.interactor.fetchAllPlanes(for: coordinates)
        })
    }
    
    func filterPlanesWithSelectedCountry() {
        if let selectedCountry = selectedCountry {
            filteredPlanes = groupedPlanes[selectedCountry] ?? []
        } else {
            filteredPlanes = planes
        }
    }
}

extension FlightsMapPresenter: FlightsMapInteractorDelegate {
    func handleOutput(_ output: FlightsMapInteractorOutput) {
        view.hideIndicator()

        switch output {
        case .showError(let error):
            view.presentAlert(text:error.localizedDescription)
        case .showFlights(let states):
            self.planes = states?.compactMap(Plane.init) ?? []
            groupedPlanes = Dictionary(grouping: planes, by: { $0.country })
            let countries = groupedPlanes.keys.sorted { $0.name < $1.name }
            delegate?.countriesDidLoad(countries: countries)
            filterPlanesWithSelectedCountry()
            view.insertPlanes(annotations: filteredPlanes)
        }
    }
}

extension FlightsMapPresenter: CounrtySelectorDelegate {
    func didAssignDelegate(countrySelector presenter: CounrtySelector.CountrySelectorPresenterProtocol) {
        delegate = presenter
    }
    
    func didSelect(country: Country?) {
        selectedCountry = country
        filterPlanesWithSelectedCountry()
        view.insertPlanes(annotations: filteredPlanes)
    }
}
