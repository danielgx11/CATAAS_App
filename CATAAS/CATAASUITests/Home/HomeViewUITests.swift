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
        
        XCTAssertTrue(loadingView.waitForExistence(timeout: 3), "The Loading View should exist")
    }
    
    func testTextIsNotEmpty() throws {
        let cell = app.staticTexts["item_cell"].firstMatch
        
        print(app.debugDescription)

        XCTAssertTrue(cell.waitForExistence(timeout: 3), "The Cell should exist")
        XCTAssertFalse(cell.label.isEmpty, "The Label should not be empty")
    }
 
}
