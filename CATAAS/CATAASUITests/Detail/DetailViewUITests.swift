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
                
        let firstCell = app.staticTexts["item_cell"].firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3), "The first cell should exist in the LazyVStack.")
        firstCell.tap()
        
    }
    
    func testLoadingViewAppears() {
        performSendToDetailScreen()
        
        let secondLoadingView = app.activityIndicators["loading_view"]
        XCTAssertTrue(secondLoadingView.waitForExistence(timeout: 3), "The loading view from the second screen should appear")
    }
    
    func testLoadedImageViewExists() {
        performSendToDetailScreen()
        
        let loadedImageView = app.images["cat_image_identifier_async"]
        let asyncImage = app.images["cat_image_identifier_async"]
        
        XCTAssertTrue(loadedImageView.exists, "The image should exist when imageData is presented")
        XCTAssertFalse(asyncImage.exists, "The async image should NOT exist when imageData is presented")
    }
    
//    func testAsyncImageViewExists() {
//        let app = XCUIApplication()
//        app.launch()
//        debugPrint(app.description)
//        let asyncImageView = app.images["cat_image_identifier_async"]
//        
//        XCTAssertTrue(asyncImageView.exists, "The async image view should exist when imageData is not present.")
//    }
    
}
