//
//  NPDemoProjectTests.swift
//  NPDemoProjectTests
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import XCTest
@testable import NPDemoProject
@testable import NPMine

class NPDemoProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("测试开始")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("测试结束")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
