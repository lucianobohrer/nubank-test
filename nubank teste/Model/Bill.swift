//
//  Bill.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/23/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class Bill: Mappable {
    var colorCode:String!
    
   
    
    
    required init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    
    // Mappable
    func mapping(map: Map) {
        
                
    }

}
