//
//  BillItem.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class BillItem: Mappable {

    var amount: Double?
    var charges: Double?
    var href: String?
    var index: Double?
    var postDate: NSDate?
    var title: String?
    
    required init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        amount  <= map["amount"]
        charges  <= map["charges"]
        href  <= map["href"]
        index  <= map["index"]
        postDate  <= (map["post_date"], CustomDateNuBank())
        title  <= map["title"]

    }
    
    func formatDataVenc(dt:NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let formatter = NSDateFormatter()
        let components = calendar.components(.DayCalendarUnit, fromDate:  dt)
        formatter.locale = NSLocale(localeIdentifier: "pt_BR_POSIX")
        formatter.dateFormat = "MMM"
        
        
        var strVenc = String(format: "%d %@", components.day , formatter.stringFromDate(dt).uppercaseString)
        
        
        
        
        return strVenc
    }

}
