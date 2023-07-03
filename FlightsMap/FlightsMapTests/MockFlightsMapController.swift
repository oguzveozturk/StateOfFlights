//
//  MockFlightsMapController.swift
//  FlightsMapTests
//
//  Created by Oğuz Öztürk on 11.06.2023.
//

import XCTest
import class Common.Plane
@testable import FlightsMap

final class MockFlightsMapController: FlightsMapViewProtocol {
    var invokeSetnitialRegion = false
    var invokeSetnitialRegionCount = 0
    func setInitialRegion() {
        invokeSetnitialRegion = true
        invokeSetnitialRegionCount += 1
    }
    
    var invokeShowIndicator = false
    var invokeShowIndicatorCount = 0
    func showIndicator() {
        invokeShowIndicator = true
        invokeShowIndicatorCount += 1
    }
    
    var invokeHideIndicator = false
    var invokeHideIndicatorCount = 0
    func hideIndicator() {
        invokeHideIndicator = true
        invokeHideIndicatorCount += 1
    }
    
    var invokeInsertPlanesParametersList = [(planes:[Common.Plane],Void)]()
    func insertPlanes(annotations: [Common.Plane]) {
        invokeInsertPlanesParametersList.append((planes:annotations,()))
    }
    
    var invokePresentAlertParametersList = [(text:String,Void)]()
    func presentAlert(text: String) {
        invokePresentAlertParametersList.append((text: text, ()))
    }
}
