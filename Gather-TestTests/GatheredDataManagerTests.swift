//
//  GatheredDataManagerTests.swift
//  Gather-TestTests
//
//  Created by vijeesh.k on 04/04/21.
//

import XCTest
@testable import Gather_Test

class GatheredDataManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFileNameGeneratorMethod() {
        let dataManager = GatheredDataManager()
        var fileName = dataManager.getFileName(index: 1)
        XCTAssertEqual(fileName, "img0001")
        
        fileName = dataManager.getFileName(index: 12)
        XCTAssertEqual(fileName, "img0012")
    }
}
