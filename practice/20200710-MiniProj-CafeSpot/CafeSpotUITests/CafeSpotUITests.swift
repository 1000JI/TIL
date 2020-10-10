//
//  CafeSpotUITests.swift
//  CafeSpotUITests
//
//  Created by 천지운 on 2020/08/12.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import XCTest

class CafeSpotUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        self.app = XCUIApplication() // 앱을 간접적으로 사용 할 수 있게 해줌
        self.app.launch()
        
        // XCUIElement => UI element에 대한 프록시
        // XCUIElementQuery
        let addButton = app.navigationBars.buttons["addButton"]
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_테스트할_것() {
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
