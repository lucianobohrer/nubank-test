//
//  DataViewController.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/22/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class DataViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var detailView: NUInfoBox!
    var dataObject: AnyObject?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setTranslatesAutoresizingMaskIntoConstraints(true)
        self.view.setNeedsLayout()
        if let bill = dataObject as? BillApiResponse {
            self.headerView.backgroundColor = UIColor(rgba: bill.colorCode())
            self.lblValue.text = bill.formatCurrency(bill.summary.totalBalance!)
            self.lblDate.text = bill.summary.formatDataVenc(bill.summary.dueDate!)
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

    //#DATASOURCE
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let bill = dataObject as? BillApiResponse {
            return bill.lines!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:NUItemsTableViewCell = tableView.dequeueReusableCellWithIdentifier("billItem") as! NUItemsTableViewCell
        if let bill = dataObject as? BillApiResponse {
            var line = bill.lines![indexPath.row] as BillItem
            cell.lblName?.text = line.title
            detailView.configDetail(bill)
            cell.lblDate?.text = line.formatDataVenc(line.postDate!)
            if(line.amount >= 0){
                cell.lblValue?.text = bill.formatCurrency(line.amount!)
                cell.configNormal()
            } else {
                cell.lblValue?.text = bill.formatCurrency(-line.amount!)
                cell.configRefund()
            }
            
            if(indexPath.row == 0 && (indexPath.row == (bill.lines!.count - 1))){
                cell.configUnique()
            } else if(indexPath.row == 0){
                cell.configFirst()
            } else if(indexPath.row == (bill.lines!.count - 1)) {
                cell.configLast()
            } else {
                cell.configMiddle()
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    

}

