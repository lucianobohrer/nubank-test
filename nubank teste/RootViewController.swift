//
//  RootViewController.swift
//  nubank teste
//
//  Created by rodrigo de souza reis on 6/22/15.
//  Copyright (c) 2015 rodrigo de souza reis. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController?
    var billServices : BillServices!
    let shape = CAShapeLayer()
    var topview : NUMonthSelect!
    var indexPage:Int = 0
    var error:NUAlertError!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController?.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.pageViewController?.view.setNeedsLayout()
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        billServices = BillServices()
        billServices.loadBills({ items in
            self.modelController.pageData = items
            self.loadPageBills()
            }, errorFunc: {error in
                self.error = NUAlertError(frame: self.view.frame)
                self.error.setErrorText(error.description)
                self.view.addSubview(self.error)
            })
    }
    
    func setBills(itens:NSArray){
        self.modelController.pageData = itens
        self.loadPageBills()
    }
    
    func loadPageBills () {
        
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.delegate = self
        self.pageViewController?.view.autoresizesSubviews = false
        
        
        let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelController
        
        self.addChildViewController(self.pageViewController!)
        
        self.view.addSubview(self.pageViewController!.view)
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMoveToParentViewController(self)
        
        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = self.pageViewController!.gestureRecognizers
        
        self.topview = NUMonthSelect(frame: CGRectMake(0, 0, self.view.frame.width, 80))
        self.topview.delegate = self
        self.topview.createCollection((self.modelController.pageData as! [BillApiResponse]))
        self.view.addSubview(topview!)

    }
    
    func setArrowColor(color: String){
       shape.fillColor = UIColor(rgba: color).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var modelController: ModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelController == nil {
            _modelController = ModelController()
            _modelController?.delegate = self;
        }
        return _modelController!
    }

    var _modelController: ModelController? = nil

    // MARK: - UIPageViewController delegate methods

    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
        let currentViewController = self.pageViewController!.viewControllers[0] as! UIViewController
        let viewControllers = [currentViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })
        
        self.pageViewController!.doubleSided = false
        
    // self.topview.collectionMonthView?.scrollToItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 1), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        return .Min
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
      let index = self.modelController.indexOfViewController(pageViewController.viewControllers[0] as! DataViewController )
        self.topview.carousel.scrollToItemAtIndex(index, animated: true)
    }
    
    func setPage(index:Int){
        let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(index, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
    }


}

