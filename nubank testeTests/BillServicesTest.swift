//
//  BillServices.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 7/2/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit
import XCTest

class BillServicesTest: XCTestCase {
    
    var service:BillServices!

    override func setUp() {
        super.setUp()
        service = BillServices()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLoadBills() {
        
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
