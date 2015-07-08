//
//  NUMonthSelect.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/7/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit
import iCarousel

class NUMonthSelect: UIView, iCarouselDataSource , iCarouselDelegate {
    
    
     @IBOutlet var carousel : iCarousel!
    var delegate:RootViewController!
    
    var billList:[BillApiResponse]!
    
    var lista = ["ABR","MAI","JUN","JUL"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.awakeFromNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        
        var backgroundImage:UIImage = UIImage(named:"nubankbarstatus")!;
        
        UIGraphicsBeginImageContext(self.bounds.size);
        
        var imagePosition:CGRect = CGRectMake((self.bounds.size.width / 2)  - (backgroundImage.size.width / 2),
            (self.bounds.size.height / 2) - (backgroundImage.size.height / 2),
            backgroundImage.size.width,
            backgroundImage.size.height)
        
        backgroundImage.drawInRect(imagePosition)
        var image:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.backgroundColor = UIColor(patternImage: image)
        
       
        
        
    }
    
    func createCollection(var items:[BillApiResponse]){
        self.billList = items
        
        self.carousel = iCarousel(frame: self.frame)
        self.carousel.dataSource = self
        self.carousel.delegate = self
        self.addSubview(self.carousel)
        carousel.type = iCarouselType.Linear
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int
    {
        return billList.count
    }
    
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: UIView!) -> UIView!
    {
        var label: UILabel? = nil
        var bill:BillApiResponse = billList[index]
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            
            var viewReuse = UIView(frame:CGRectMake(0, 0, 50, 50))
            viewReuse.contentMode = .Center
            
            label = UILabel(frame:viewReuse.bounds)
            label!.backgroundColor = UIColor.clearColor()
            label!.textAlignment = .Center
            label!.font = UIFont.boldSystemFontOfSize(16)
            label!.textColor = UIColor(rgba: bill.colorCode())
            label!.tag = 1
            viewReuse.addSubview(label!)
            label?.text = bill.summary.getMonth(bill.summary.closeDate!)
            return viewReuse
        }
        else
        {
            label = view.viewWithTag(1) as? UILabel
            label?.text = bill.summary.getMonth(bill.summary.closeDate!)
        }
        
       
        
        
        return view
    }
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == iCarouselOption.Spacing)
        {
            return value * 1.1
        }
        return value
    }
    
    func carousel(carousel:iCarousel!, didSelectItemAtIndex index:Int) {
        delegate.setPage(index)
    }
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel!) {
        delegate.setPage(carousel.currentItemIndex)
    }
    
    

}
