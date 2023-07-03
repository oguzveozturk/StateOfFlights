//
//  MockCountrySelectorController.swift
//  CounrtySelectorTests
//
//  Created by Oğuz Öztürk on 11.06.2023.
//

import XCTest
@testable import CounrtySelector

final class MockCountrySelectorController: CountrySelectorViewProtocol {

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedSetTitleParametersList = [(text: String, Void)]()

    func setTitle(_ text: String) {
        invokedSetTitleParametersList.append((text, ()))
    }

    var invokedAddCheckmark = false
    var invokedAddCheckmarkCount = 0
    var invokedAddCheckmarkParameters: (at: Int, Void)?
    var invokedAddCheckmarkParametersList = [(at: Int, Void)]()

    func addCheckmark(_ at:Int) {
        invokedAddCheckmark = true
        invokedAddCheckmarkCount += 1
        invokedAddCheckmarkParameters = (at, ())
        invokedAddCheckmarkParametersList.append((at, ()))
    }

    var invokedRemoveCheckmark = false
    var invokedRemoveCheckmarkCount = 0
    var invokedRemoveCheckmarkParameters: (at: Int, Void)?
    var invokedRemoveCheckmarkParametersList = [(at: Int, Void)]()

    func removeCheckmark(_ at:Int) {
        invokedRemoveCheckmark = true
        invokedRemoveCheckmarkCount += 1
        invokedRemoveCheckmarkParameters = (at, ())
        invokedRemoveCheckmarkParametersList.append((at, ()))
    }
}
