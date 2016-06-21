//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
     var selectedPhoto: UIImageView!
     var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }
    
    
    
   
    @IBAction func tapPhoto(sender: UITapGestureRecognizer) {
        
        selectedPhoto = sender.view as! UIImageView
        
        
        performSegueWithIdentifier("toPhoto", sender: nil)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.4
        
        
        destinationViewController.imageCatturata = self.selectedPhoto.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        destinationViewController.transitioningDelegate = fadeTransition
        
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        
   
        
    }

    
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
}
