//
//  BillApiResponse.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

public enum BillStates: String {
    case Overdue = "overdue"
    case Closed = "closed"
    case Open = "open"
    case Future = "future"
}

class BillApiResponse: Mappable {
    
    var barcode: String?
    var id: String!
    var linhaDigital: String?
    var state: BillStates!
    var summary: Summary!
        
        required init(){}
        
        required init?(_ map: Map) {
            mapping(map)
        }
        
        
        // Mappable
        func mapping(map: Map) {  
            barcode  <= map["bill.barcode"]
            id  <= map["bill.id"]
            linhaDigital  <= map["bill.linha_digitavel"]
            state  <= map["bill.state"]
            summary <= map["bill.summary"]
        }
}
