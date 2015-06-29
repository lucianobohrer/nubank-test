//
//  DataViewController.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/22/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    var dataObject: AnyObject?


    override func viewDidLoad() {
        super.viewDidLoad()
        if let bill = dataObject as? Bill {
            self.headerView.backgroundColor = UIColor(rgba: bill.colorCode)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        /*if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description
        } else {
            self.dataLabel!.text = ""
        }*/
    }


}

