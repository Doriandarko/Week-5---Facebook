//
//  StoryViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 0
        
        scrollView.sendSubviewToBack(imageView)
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification) -> Void in
            var userInfo = notification.userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            let kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size
            let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            let animationDuration = durationValue.doubleValue
            let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationCurve = curveValue.integerValue
            
            self.commentContainer.frame.origin.y = self.view.frame.size.height - kbSize.height - self.commentContainer.frame.size.height
        })
    
    
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification) -> Void in
            var userInfo = notification.userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            let kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
            let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            let animationDuration = durationValue.doubleValue
            let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationCurve = curveValue.integerValue
            
            
            self.commentContainer.frame.origin.y = self.scrollView.frame.size.height + self.scrollView.frame.origin.y
        })
        
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func onCommentButton(sender: AnyObject) {
            commentField.becomeFirstResponder()
        }
        
        @IBAction func onBackButton(sender: AnyObject) {
            navigationController!.popViewControllerAnimated(true)
        }
        
        @IBAction func onLikeButton(sender: AnyObject) {
            likeButton.selected = !likeButton.selected
        }
        
        @IBAction func onTap(sender: AnyObject) {
            view.endEditing(true)
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
