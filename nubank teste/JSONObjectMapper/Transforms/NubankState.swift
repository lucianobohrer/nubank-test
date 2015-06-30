//
//  NubankState.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import Foundation

public class NubankState: TransformType {
    public typealias Object = BillStates
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJSON(value: AnyObject?) -> BillStates? {
        if let stateString = value as? String {
            if(stateString == "closed"){
                    return BillStates.Closed
            }
            if(stateString == "future"){
                return BillStates.Future
            }
            if(stateString == "overdue"){
                return BillStates.Overdue
            }
            if(stateString == "open"){
                return BillStates.Open
            }
            
        }
        return nil
    }
    
    public func transformToJSON(value: BillStates?) -> String? {
        
        return value?.rawValue
    }
}

