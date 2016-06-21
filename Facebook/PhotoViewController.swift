//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Pietro Schirano on 6/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var doneButton: UIImageView!
    
    @IBOutlet weak var tabBar: UIImageView!
    var imageCatturata: UIImage!

    @IBOutlet weak var photoToShow: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoToShow.image = imageCatturata
        
        
        scrollView.delegate = self
        photoToShow.clipsToBounds = true
        
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        scrollView.contentSize = CGSize(width: 320, height: 569)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }
    
    
    
    
    // scrolling
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let alpha = 1 - (abs(scrollView.contentOffset.y) / scrollView.frame.height) * 2
    
        self.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        
        if abs(scrollView.contentOffset.y) > 100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.1){
            self.tabBar.alpha = 0
            self.doneButton.alpha = 0
        }
        
    }
    

    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        if abs(scrollView.contentOffset.y) < 40 {
            UIView.animateKeyframesWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                self.tabBar.alpha = 1
                self.doneButton.alpha = 1
                }, completion: nil)
        } else {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        UIView.animateKeyframesWithDuration(0.1, delay: 0, options: [], animations: { () -> Void in
            
            }, completion: nil)
    }
    
    
    // zooming
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoToShow
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        
        if abs(scrollView.contentOffset.y) > 0 {
            self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            dismissViewControllerAnimated(false, completion: nil)
        }
        
        self.doneButton.alpha = 0
        self.tabBar.alpha = 0
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        if scale == 1 {
            self.doneButton.alpha = 1
            self.tabBar.alpha = 1
        } else {
        }
    }
    
    
    
    
    

}
