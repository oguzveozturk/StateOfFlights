//
//  CounrtySelectorPresenterTests.swift
//  CounrtySelectorTests
//
//  Created by Oğuz Öztürk on 10.06.2023.
//

import XCTest
@testable import CounrtySelector

final class CounrtySelectorPresenterTests: XCTestCase {

    private var presenter:CountrySelectorPresenter!
    private var view:MockCountrySelectorController!
    private var delegate:MockCountrySelectorDelegate!
    
    override func setUp() {
        super.setUp()
        view = MockCountrySelectorController()
        delegate = MockCountrySelectorDelegate()
        presenter = .init(view: view, delegate: delegate)
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
        delegate = nil
    }
    
    func test_Load() {
        XCTAssertTrue(view.invokedSetTitleParametersList.isEmpty)
        XCTAssertFalse(delegate.invokedDidAssignDelegate)
        XCTAssertEqual(delegate.invokedDidAssignDelegateCount, 0)
        presenter.load()
        XCTAssertEqual(view.invokedSetTitleParametersList.map(\..text), ["Select Country"])
        XCTAssertTrue(delegate.invokedDidAssignDelegate)
        XCTAssertEqual(delegate.invokedDidAssignDelegateCount, 1)
    }
    
}
