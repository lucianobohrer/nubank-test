//
//  NUMonthSelect.swift
//  nubank teste
//
//  Created by Rodrigo de Souza Reis on 7/7/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class NUMonthSelect: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet var collectionMonthView: UICollectionView?
    
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
        
        self.createCollection()
        
    }
    
    func createCollection(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionMonthView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionMonthView!.dataSource = self
        collectionMonthView!.delegate = self
        collectionMonthView!.registerClass(NUCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionMonthView!.backgroundColor = UIColor.clearColor()
        collectionMonthView!.showsHorizontalScrollIndicator = false
        
        var collectionViewWidth:CGFloat = CGRectGetWidth(collectionMonthView!.bounds);
        collectionMonthView?.contentInset = UIEdgeInsetsMake(0, collectionViewWidth/2-layout.itemSize.width, 0 , collectionViewWidth/2)
        
        
        self.addSubview(collectionMonthView!)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! NUCollectionViewCell
        cell.lblText.text = lista[indexPath.row]
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var collectionViewWidth:CGFloat = CGRectGetWidth(collectionMonthView!.bounds);
       
        
        let cell:NUCollectionViewCell = collectionMonthView!.cellForItemAtIndexPath(indexPath) as! NUCollectionViewCell
        let offset:CGPoint = CGPointMake( cell.center.x - (collectionViewWidth / 2 - 10), 0);
        collectionMonthView?.setContentOffset(offset, animated: true)
    }
    
    

}
