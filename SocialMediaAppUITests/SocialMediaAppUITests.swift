//
//  SocialMediaAppUITests.swift
//  SocialMediaAppUITests
//
//  Created by Surath Chathuranga on 2023-04-12.
//

import XCTest

final class SocialMediaAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
                
        
//        let userEmail = app.textFields["Email"]
//        XCTAssertTrue(userEmail.exists)
//
//        userEmail.tap()
//        userEmail.typeText("Surath@gmail.com")
//
//        let passwordSecureTextField = app.secureTextFields["Password"]
//        XCTAssertTrue(passwordSecureTextField.exists)
//
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText("Surath123")
        
        //let button = app.buttons["Sign In"]
        //XCTAssertTrue(button.exists)
        //button.tap()
        
        

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
