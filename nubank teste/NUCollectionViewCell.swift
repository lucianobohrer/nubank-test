//
//  NUCollectionViewCell.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/7/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class NUCollectionViewCell: UICollectionViewCell {
    
    var lblText:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let textFrame = CGRect(x: 8, y: 8, width: 30, height: 30)
        lblText = UILabel(frame: textFrame)
        lblText.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        lblText.textAlignment = .Center
        self.contentView.addSubview(lblText)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
