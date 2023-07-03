//
//  FlightsMapContracts.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import FlightAPI
import Common
import CommonViews
import CounrtySelector

// MARK: - Interactor

protocol FlightsMapInteractorProtocol: AnyObject {
    /// Communicate between FlightsMapInteractor --> FlightsMapPresenter
    var delegate: FlightsMapInteractorDelegate? { get set }
    
    /// Sends request for getting all Flights (or) Planes from API
    /// - Parameter coordinates: Coordinates corresponding to the upper left and lower right corners of the device frame
    func fetchAllPlanes(for coordinates:Coordinates)
}

/// Conditions for the result from API
enum FlightsMapInteractorOutput {
    case showFlights([StateVector]?)
    case showError(Error)
}

protocol FlightsMapInteractorDelegate: AnyObject {
    ///  API result
    /// - Parameter output: Conditions that hold the data(or) error returned from API
    func handleOutput(_ output: FlightsMapInteractorOutput)
}

// MARK: - Presenter

protocol FlightsMapPresenterProtocol: AnyObject {
    /// This is the same data that returns from server for state of flights.
    /// But renamed and removed unnecessary propertys for simplicty.
    var planes:[Plane] { get set }
    
    /// This is the actual data that user sees. It can be empty.
    ///  If there is no selected country, filteredPlanes equeals to planes.
    var filteredPlanes:[Plane] { get set }
    
    /// Planes that are gouped by origin country
    var groupedPlanes: Dictionary<Country, [Plane]> { get set }
    
    /// selectedCountry is used instead of selectedIndex, because selectedCountry
    /// can be added or removed from the array as the user drags the map.
    var selectedCountry:Country? { get set }
    
    /// Communicate between FlightsMapPresenter --> CountrySelectorPresenter
    var delegate:CountriesDidLoadDelegate? { get set }
    
    /// Loads presenter's crucial functions
    func load()
    
    /// Triggered with mapKit's delegate. Whenever user drags the map this function called.
    /// - Parameter coordinates: Coordinates corresponding to the upper left and lower right corners of the device frame
    func regionChange(_ coordinates: Coordinates)
}

// MARK: - View

protocol FlightsMapViewProtocol: AnyObject {
    /// Sets initial country for map. First planes that shows on the map triggered from here
    func setInitialRegion()
    
    /// Shows indicator that shows on the top right corner of the screen
    func showIndicator()
    
    /// Hides indicator that shows on the top right corner of the screen
    func hideIndicator()
    
    /// Adds annotations to the map
    /// - Parameter annotations: Annotations that represents airplanes
    func insertPlanes(annotations: [Plane])

    func presentAlert(text: String)
}

// MARK: - Router

enum FlightsMapRoute {
    case countrySelectorController(CounrtySelectorDelegate)
}

protocol FlightsMapRouterProtocol: AnyObject {
    /// Navigates the screens from FlightsMap module
    /// - Parameter route:Defines screens that can be routed
    func present(route: FlightsMapRoute)
}
