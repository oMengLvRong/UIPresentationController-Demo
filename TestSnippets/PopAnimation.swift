//
//  PopAnimation.swift
//  TestSnippets
//
//  Created by integrated on 12/29/15.
//  Copyright © 2015 integrated. All rights reserved.
//

import UIKit

class PopAnimation: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresentation : Bool = false
    
    // presented = ShowViewController
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return PopPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresentation = false
        
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresentation = true
        
        return self
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
     
        let time = transitionDuration(transitionContext)
        let containerView = transitionContext.containerView()!
        
        if isPresentation {
            
            let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            if let toView = toVc?.view {
                
                transitionContext.containerView()?.addSubview(toView)
             
                toView.transform = CGAffineTransformScale(CGAffineTransform(), 0, 0)
                
                UIView.animateWithDuration(time, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .OverrideInheritedCurve, animations: { () -> Void in
                        toView.transform = CGAffineTransformIdentity
                    }, completion: { (isSuccess) -> Void in
                        transitionContext.completeTransition(isSuccess)
                })
            
            }
            
        } else {
            
            if let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view {
               
                UIView.animateWithDuration(time, animations: { () -> Void in
                    fromView.frame.origin.y = containerView.frame.height
                    }, completion: { (isSuccess) -> Void in
                        transitionContext.completeTransition(isSuccess)
                })
                
            }
        }
        
    }
    
}
