//
//  NUInfoBox.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/6/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class NUInfoBox: UIView {
    
    @IBOutlet var heightConstant: NSLayoutConstraint!
    @IBOutlet var btnConstant: NSLayoutConstraint!

    @IBOutlet var lblPay: UILabel!
    @IBOutlet var lblValue: UILabel!
    @IBOutlet var btnDoc: UIButton!
    @IBOutlet var viewListDetail: UIView!
    @IBOutlet var lblValueMonth: UILabel!
    @IBOutlet var lblNoPay: UILabel!
    @IBOutlet var lblTax: UILabel!
    
    var border:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints()
        border = UIView()
        border.backgroundColor = UIColor(rgba: "#cccccc")
        border.frame = CGRect(x: 0, y: heightConstant.constant-1.0, width: self.frame.width, height: 1.0)
        self.addSubview(border)
    }
    
    func configHeight(height:CGFloat) {
        heightConstant.constant =  height
        border.frame = CGRect(x: 0, y: heightConstant.constant-1.0, width: self.frame.width, height: 1.0)
    }
    
    func configDetail(bill : BillApiResponse){
        hideAll()
        if(bill.state == BillStates.Overdue) {
            showOverdue()
            self.configHeight(94.0)
            self.lblValue.text = bill.formatCurrency(bill.summary.paid!)
        } else if(bill.state == BillStates.Closed) {
                self.configHeight(188.0)
            btnDoc.tintColor = UIColor(rgba: bill.colorCode())
            btnDoc.layer.borderWidth = 1.0
            btnDoc.layer.cornerRadius = 3.0
            btnDoc.layer.borderColor = UIColor(rgba: bill.colorCode()).CGColor
            showClosed()
            lblNoPay.text = bill.formatCurrency(bill.summary.pastBalance!)
            lblTax.text = bill.formatCurrency(bill.summary.interest!)
            lblValueMonth.text = bill.formatCurrency(bill.summary.totalBalance!)
        } else if(bill.state == BillStates.Open) {
            self.configHeight(94.0)
            btnDoc.tintColor = UIColor(rgba: bill.colorCode())
            btnDoc.layer.borderWidth = 1.0
            btnDoc.layer.cornerRadius = 3.0
            btnDoc.layer.borderColor = UIColor(rgba: bill.colorCode()).CGColor
            showOpen()
        }
        else {
            self.configHeight(0.0)
        }
    }
    
    func hideAll(){
        self.hideOverdue()
        self.hideClosed()
        self.hideOpen()
    }
    
    func hideOverdue(){
        lblValue.hidden = true
        lblPay.hidden = true
    }
    
    func showOverdue(){
        self.lblPay.textColor = UIColor(rgba: "#7ED321")
        self.lblValue.textColor =  UIColor(rgba: "#7ED321")
        self.lblPay.text = "PAGAMENTO RECEBIDO"
        lblValue.hidden = false
        lblPay.hidden = false
    }
    
    func hideClosed(){
         viewListDetail.hidden = true
    }
    
    func showClosed(){
        viewListDetail.hidden = false
    
    }
    
    func hideOpen(){
       btnConstant.constant = 40
    }
    
    func showOpen(){
        btnConstant.constant = -40
        
    }
}
