//
//  MockCountrySelectorDelegate.swift
//  CounrtySelectorTests
//
//  Created by Oğuz Öztürk on 11.06.2023.
//

import XCTest
import Common
@testable import CounrtySelector

final class MockCountrySelectorDelegate: CounrtySelectorDelegate {

    var invokedDidAssignDelegate = false
    var invokedDidAssignDelegateCount = 0

    func didAssignDelegate(countrySelector presenter: CountrySelectorPresenterProtocol) {
        invokedDidAssignDelegate = true
        invokedDidAssignDelegateCount += 1
    }

    var invokedDidSelect = false
    var invokedDidSelectCount = 0
    var invokedDidSelectParameters: (country: Country?, Void)?
    var invokedDidSelectParametersList = [(country: Country?, Void)]()

    func didSelect(country: Country?) {
        invokedDidSelect = true
        invokedDidSelectCount += 1
        invokedDidSelectParameters = (country, ())
        invokedDidSelectParametersList.append((country, ()))
    }
}
