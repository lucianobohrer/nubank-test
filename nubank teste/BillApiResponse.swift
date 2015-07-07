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
    var lines: [BillItem]?
        
        required init(){}
        
        required init?(_ map: Map) {
            mapping(map)
        }
        
        
        // Mappable
        func mapping(map: Map) {  
            barcode  <= map["bill.barcode"]
            id  <= map["bill.id"]
            linhaDigital  <= map["bill.linha_digitavel"]
            state  <= (map["bill.state"], NubankState())//map["bill.state"]
            summary <= map["bill.summary"]
            lines <= map["bill.line_items"]
        }
    
    
    func colorCode ()->String{
        if(state.rawValue == "open") {
             return "#40AAB9"
        }
        if(state.rawValue == "closed") {
            return "#E5615C"
        }
        if(state.rawValue == "overdue") {
            return "#7ED321"
        }
        if(state.rawValue == "future") {
             return "#F5A623"
        }

             return "#ffffff"
     
    }
    
    func formatCurrency(currentString: Double) -> String {
       
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        var numberFromField = (currentString)/100
        return formatter.stringFromNumber(numberFromField)!
    }
}
