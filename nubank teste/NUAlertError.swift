//
//  NUAlertError.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/7/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class NUAlertError: UIView {
    var lblError:UILabel!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
         lblError = UILabel(frame: CGRectMake(10, 100, 280, 350))
        lblError.textColor = UIColor.whiteColor()
        lblError.numberOfLines = 4
         var lblTitle = UILabel(frame: CGRectMake(60, 20, 250, 200))
        lblTitle.text = "Ops! Ocorreu um problema!"
        lblTitle.textColor = UIColor.whiteColor()
        self.backgroundColor = UIColor(rgba: "#000000")
        self.alpha = 0.8
        self.addSubview(lblTitle)
        self.addSubview(lblError)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setErrorText(error:String){
        
        lblError.text = error
    }
    

}
