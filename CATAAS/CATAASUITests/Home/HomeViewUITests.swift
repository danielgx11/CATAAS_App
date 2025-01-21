//
//  HomeViewUITests.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    
    // MARK: - PROPERTIES

    let app = XCUIApplication()

    // MARK: - FIXTURE
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }
    
    // MARK: - TEST CASES
    
    func testLoadingViewAppears() {
        let loadingView = app.activityIndicators["loading_view"]
        
        debugPrint(app.debugDescription)
        
        XCTAssertTrue(loadingView.exists, "The Loading View should exist")
    }
    
    func testTextIsNotEmpty() {
        let cell = app.staticTexts["item_cell"].firstMatch
        
        XCTAssertTrue(cell.waitForExistence(timeout: 3), "The Cell should exist")
        XCTAssertFalse(cell.label.isEmpty, "The Label should not be empty")
    }
 
    func testCellsLoaded() {
        let app = XCUIApplication()
        app.launch()
        
        let delayExpectation = XCTestExpectation(description: "Wait for API to load items")
        _ = XCTWaiter.wait(for: [delayExpectation], timeout: 3.0)
                
        let firstCell = app.staticTexts["item_cell"].firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3), "The first cell should exist in the LazyVStack.")
        firstCell.tap()
    }
    
    func testCellsLoadedTapToNextView() {
        let app = XCUIApplication()
        app.launch()
        
        let delayExpectation = XCTestExpectation(description: "Wait for API to load items")
        _ = XCTWaiter.wait(for: [delayExpectation], timeout: 3.0)
                
        let firstCell = app.staticTexts["item_cell"].firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3), "The first cell should exist in the LazyVStack.")
        firstCell.tap()
        
        let secondLoadingView = app.activityIndicators["loading_view"]
        XCTAssertTrue(secondLoadingView.waitForExistence(timeout: 3), "The loading view from the second screen should appear")
    }

}
