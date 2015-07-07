//
//  BillServices.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/30/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit
import Alamofire


class BillServices: NSObject {
    let url:String = "https://s3-sa-east-1.amazonaws.com/mobile-challenge/bill/bill_new.json"
    
    func loadBills(returnFunc: NSArray -> Void,errorFunc: NSString -> Void) {
        
        request(.GET, url, parameters: nil)
            .responseJSON { (request, response, JSON, error) in
                if(error == nil) {
                    let tempDatasource = Mapper<BillApiResponse>().mapArray(JSON)
                    println(JSON)
                    //self.delegate.setBills(tempDatasource!)
                    returnFunc(tempDatasource!)
                } else {
                    if(response?.statusCode >= 400 && response?.statusCode <= 499){
                        errorFunc("Houve algum erro com o seu pedido.")
                        return;
                    }
                    if(response?.statusCode >=  500 && response?.statusCode <=  599) {
                        errorFunc("Desculpe, estamos enfrentando problemas técnicos. Por favor, tente novamente mais tarde.")
                        return;
                    }
                    errorFunc("Parece que você está sem internet! Por favor, verifique a sua conexão e tente novamente.")
                }

        }
    }
}
