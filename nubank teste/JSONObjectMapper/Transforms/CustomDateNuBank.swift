//
//  CustomDateNuBank.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import Foundation

public class CustomDateNuBank: TransformType {
    public typealias Object = NSDate
    public typealias JSON = String
    
    public init() {}
    
    private lazy var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
        }()
    
    public func transformFromJSON(value: AnyObject?) -> NSDate? {
        if let dateString = value as? String {
            return dateFormatter.dateFromString(dateString)
        }
        return nil
    }
    
    public func transformToJSON(value: NSDate?) -> String? {
        if let date = value {
            return dateFormatter.stringFromDate(date)
        }
        return nil
    }
}

