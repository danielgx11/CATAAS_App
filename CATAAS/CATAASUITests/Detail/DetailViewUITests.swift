//
//  DetailViewUITests.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

import XCTest

final class DetailViewUITests: XCTestCase {
    
    
    // MARK: - PROPERTIES
    
    let app = XCUIApplication()
    
    // MARK: - FIXTURE
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }
}

    
// MARK: - TEST CASES
  
extension DetailViewUITests {
    
    func performSendToDetailScreen() {
        let delayExpectation = XCTestExpectation(description: "Wait for API to load items")
        _ = XCTWaiter.wait(for: [delayExpectation], timeout: 3.0)
                
//        let firstCell = app.staticTexts.matching(identifier: "item_cell").element(boundBy: 2) /// just in case error scenaries
        let firstCell = app.staticTexts.matching(identifier: "item_cell").element(boundBy: 5) /// just in case success scenaries
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3), "The first cell should exist in the LazyVStack.")
        firstCell.tap()
    }
    
    func testLoadingViewAppears() {
        performSendToDetailScreen()
        
        let secondLoadingView = app.activityIndicators["loading_view"]
        XCTAssertTrue(secondLoadingView.exists, "The loading view from the second screen should appear")
    }
    
    func testLoadedImageViewExists() {
        performSendToDetailScreen()
        
        let delay = XCTestExpectation(description: "Wait for API to load items")
        _ = XCTWaiter.wait(for: [delay], timeout: 5.0)
        
        let loadedImageView = app.images["cat_image_identifier"]
        let asyncImage = app.images["cat_image_identifier_async"]
        let errorView = app.staticTexts["error_view"]
        let loadingView = app.activityIndicators["loading_view"]
        
        if !loadedImageView.exists, loadingView.exists, errorView.waitForExistence(timeout: 10) {
            XCTAssertFalse(loadedImageView.waitForExistence(timeout: 3), "The image should NOT exist in error scenary")
            return
        }
                
        XCTAssertTrue(loadedImageView.waitForExistence(timeout: 3), "The image should exist when imageData is presented")
        XCTAssertFalse(asyncImage.waitForExistence(timeout: 3), "The async image should NOT exist when imageData is presented")
    }

}
