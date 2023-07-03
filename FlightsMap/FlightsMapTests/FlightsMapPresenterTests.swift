//
//  FlightsMapPresenterTests.swift
//  FlightsMapPresenterTests
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import XCTest
import FlightAPI
import Common
@testable import FlightsMap

final class FlightsMapPresenterTests: XCTestCase {
    
    private var presenter:FlightsMapPresenter!
    private var view: MockFlightsMapController!
    private var interactor: MockFlightsMapInteractor!
    private var router: MockFlightsMapRouter!
    
    private var flightsMapInteractorOutputSuccess: FlightsMapInteractorOutput {
        .showFlights(Bundle(for: Self.self).decode(FlightState.self, from: "FlightStateResponse.json").states)
    }
    
    private var error: NSError {
        NSError(domain: "", code: 404, userInfo: [ NSLocalizedDescriptionKey: "Network Error"])
    }
    
    override func setUp() {
        super.setUp()
        view = MockFlightsMapController()
        interactor = MockFlightsMapInteractor()
        router = MockFlightsMapRouter()
        presenter = .init(view: view, interactor: interactor, router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
        interactor = nil
        router = nil
    }
    
    func test_load() {
        XCTAssertFalse(view.invokeSetnitialRegion)
        XCTAssertEqual(view.invokeSetnitialRegionCount, 0)
        
        XCTAssertFalse(router.invokePresentRoute)
        XCTAssertEqual(router.invokePresentRouteCount, 0)
        
        presenter.load()
        
        XCTAssertTrue(view.invokeSetnitialRegion)
        XCTAssertEqual(view.invokeSetnitialRegionCount, 1)
        
        XCTAssertTrue(router.invokePresentRoute)
        XCTAssertEqual(router.invokePresentRouteCount, 1)
    }
    
    func test_regionDidChange() {
        XCTAssertFalse(view.invokeShowIndicator)
        XCTAssertEqual(view.invokeShowIndicatorCount, 0)
        
        XCTAssertTrue(interactor.invokeFetchAllPlanesParametersList.isEmpty)
        
        let coordinates = Coordinates()
        presenter.regionChange(Coordinates())
        
        XCTAssertTrue(view.invokeShowIndicator)
        XCTAssertEqual(view.invokeShowIndicatorCount, 1)
        
        XCTAssertEqual(interactor.invokeFetchAllPlanesParametersList.map(\.coordinates), [coordinates])
        
    }
    
    func test_setFiltered() {
        XCTAssertTrue(presenter.filteredPlanes.isEmpty)
        
        presenter.handleOutput(flightsMapInteractorOutputSuccess)
        presenter.didSelect(country: Country(name: "Turkey"))
        presenter.filterPlanesWithSelectedCountry()
        
        XCTAssertEqual(presenter.filteredPlanes.count, 45)
    }
    
    func test_handleOutputSuccess() {
        XCTAssertFalse(view.invokeHideIndicator)
        XCTAssertEqual(view.invokeHideIndicatorCount, 0)
        
        XCTAssertEqual(presenter.planes.count, 0)
        XCTAssertEqual(presenter.filteredPlanes.count, 0)
        XCTAssertEqual(presenter.groupedPlanes.count, 0)
        
        XCTAssertTrue(view.invokeInsertPlanesParametersList.isEmpty)
        
        presenter.handleOutput(flightsMapInteractorOutputSuccess)
        
        XCTAssertTrue(view.invokeHideIndicator)
        XCTAssertEqual(view.invokeHideIndicatorCount, 1)
        
        XCTAssertEqual(presenter.planes.count, 66)
        XCTAssertEqual(presenter.filteredPlanes.count, 66)
        XCTAssertEqual(presenter.groupedPlanes.count, 17)
        
        XCTAssertEqual(view.invokeInsertPlanesParametersList.map(\.planes), [presenter.planes])
    }
    
    func test_handleOutputError() {
        XCTAssertFalse(view.invokeHideIndicator)
        XCTAssertEqual(view.invokeHideIndicatorCount, 0)
        
        XCTAssertEqual(presenter.planes.count, 0)
        XCTAssertEqual(presenter.filteredPlanes.count, 0)
        XCTAssertEqual(presenter.groupedPlanes.count, 0)
        
        XCTAssertTrue(view.invokeInsertPlanesParametersList.isEmpty)
        
        presenter.handleOutput(.showError(error))
        
        XCTAssertTrue(view.invokeHideIndicator)
        XCTAssertEqual(view.invokeHideIndicatorCount, 1)
        
        XCTAssertEqual(presenter.planes.count, 0)
        XCTAssertEqual(presenter.filteredPlanes.count, 0)
        XCTAssertEqual(presenter.groupedPlanes.count, 0)
        
        XCTAssertTrue(view.invokeInsertPlanesParametersList.isEmpty)
    }
    
    
    func test_DidSelectCountry() {
        let country = Country(name: "Turkey")
        XCTAssertNil(presenter.selectedCountry)
        XCTAssertTrue(view.invokeInsertPlanesParametersList.isEmpty)
        
        presenter.didSelect(country: country)
        
        XCTAssertEqual(presenter.selectedCountry, country)
        XCTAssertEqual(view.invokeInsertPlanesParametersList.map(\.planes), [presenter.filteredPlanes])
        
    }
}
