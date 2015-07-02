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
        postDate  <= (map["post_date"], DateTransform())
        title  <= map["title"]

    }

}
