//
//  Summary.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class Summary: Mappable {
    
    
   
    
    var closeDate: NSDate?
    var dueDate: NSDate?
    var interest: Double?
    var minimumPayment: Double?
    var openDate: NSDate?
    var paid: Double?
    var pastBalance: Double?
    var totalBalance: Double?
    var totalCumulative: Double?
    
    required init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    
    // Mappable
    func mapping(map: Map) {
        closeDate  <= (map["close_date"], CustomDateNuBank())
        dueDate  <= (map["due_date"], CustomDateNuBank())
        interest  <= map["interest"]
        minimumPayment  <= map["minimum_payment"]
        openDate  <= (map["open_date"], CustomDateNuBank())
        paid  <= map["paid"]
       pastBalance  <= map["past_balance"]
       totalBalance  <= map["total_balance"]
        totalCumulative  <= map["total_cumulative"]
        
    }
    
    func formatDataVenc(dt:NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
       let formatter = NSDateFormatter()
        let components = calendar.components(.DayCalendarUnit, fromDate:  dt)
        formatter.locale = NSLocale(localeIdentifier: "pt_BR_POSIX")
        formatter.dateFormat = "MMM"
        
        
        var strVenc = String(format: "Vencimento %d %@", components.day , formatter.stringFromDate(dt).uppercaseString)
        
        
        
        
        return strVenc
    }
}
