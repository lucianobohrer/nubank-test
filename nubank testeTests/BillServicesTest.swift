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
        service.loadBills({ items in
                XCTAssert(true, "Pass")
            }, errorFunc: {error in
                XCTAssert(false, "Pass")
        })
        
    }

}
