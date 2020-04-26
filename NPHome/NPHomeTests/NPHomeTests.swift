//
//  NPHomeTests.swift
//  NPHomeTests
//
//  Created by 李永杰 on 2020/4/26.
//  Copyright © 2020 NewPath. All rights reserved.
//

import XCTest
@testable import NPHome

class NPHomeTests: XCTestCase {

    let dataHandler = NPHomeDataHandle()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            
        }
    }
    
    func testRequestData() {
        
        dataHandler.requestHomeData { (results) in
            // 要求返回结果不是空数组
            XCTAssertNotNil(results, "nil")
        }
    }
    
    
}
