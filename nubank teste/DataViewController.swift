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
    @IBOutlet weak var lblInfo: UILabel!
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
            if(bill.state == BillStates.Open){
                self.lblInfo.text = bill.summary.closeDateFormat(bill.summary.closeDate!)
            } else if(bill.state == BillStates.Future) {
               self.lblInfo.text = "FATURA PARCIAL"
            }
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
            cell.lblName?.adjustsFontSizeToFitWidth = false
            cell.lblName?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
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
        if let bill = dataObject as? BillApiResponse {
            var line = bill.lines![indexPath.row] as BillItem
            if(line.href != nil){
                self.openURLAppNubank(line.href!)
            }
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! NUCustomHeaderCell
        if let bill = dataObject as? BillApiResponse {
            headerCell.lblOpenClose.text = String(format: "%@ ATÉ %@", arguments: [bill.summary.formatDataCompact(bill.summary.openDate!),bill.summary.formatDataCompact(bill.summary.closeDate!)])
        }
        return headerCell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    private func openURLAppNubank(url:String) {
        if let nubanklURL:NSURL = NSURL(string:url) {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(nubanklURL)) {
                application.openURL(nubanklURL);
            }
        }
    }
    

}

