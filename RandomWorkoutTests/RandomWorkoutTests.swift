//
//  RandomWorkoutTests.swift
//  RandomWorkoutTests
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import UIKit
import XCTest
import RandomWorkout

class RandomWorkoutTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() async {
        // This is an example of a functional test case.
        
        Helpers.fetchFirstImage(query: "Push-ups") {image in
            XCTAssertNotNil(image)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
