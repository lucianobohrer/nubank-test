//
//  NUItemsTableViewCell.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/6/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class NUItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var graLblLineTop: UILabel!
    @IBOutlet weak var graLblCircle: UILabel!
    @IBOutlet weak var graLblLineBottom: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        graLblCircle.layer.cornerRadius = 4.5
        graLblCircle.clipsToBounds = true;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configFirst(){
        graLblLineTop.hidden = true
        graLblLineBottom.hidden = false
        graLblCircle.hidden = false
    }
    
    func configMiddle(){
        graLblLineTop.hidden = false
        graLblLineBottom.hidden = false
        graLblCircle.hidden = false
    }
    func configLast(){
        graLblLineTop.hidden = false
        graLblLineBottom.hidden = true
        graLblCircle.hidden = false
    }
    func configUnique(){
        graLblLineTop.hidden = true
        graLblLineBottom.hidden = true
        graLblCircle.hidden = false
    }
    
    func configRefund(){
       lblName.textColor = UIColor(rgba: "#7ED321")
       lblValue.textColor = UIColor(rgba: "#7ED321")
        lblDate.textColor = UIColor(rgba: "#7ED321")
    }
    func configNormal(){
        lblName.textColor = UIColor.grayColor()
        lblValue.textColor = UIColor.grayColor()
        lblDate.textColor = UIColor.grayColor()
    }

}
