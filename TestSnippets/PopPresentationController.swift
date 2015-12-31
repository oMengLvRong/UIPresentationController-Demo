//
//  PopPresentationController.swift
//  TestSnippets
//
//  Created by integrated on 12/29/15.
//  Copyright © 2015 integrated. All rights reserved.
//

import UIKit

class PopPresentationController: UIPresentationController {

    /// 遮罩
    lazy var cover : UIButton = { [unowned self] in
        let cover = UIButton()
        cover.alpha = 0.0
        cover.backgroundColor = UIColor.redColor()
        cover.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
        return cover
    }()
    
    func dismiss() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
     是在呈现过渡即将开始的时候被调用的。我们在这个方法中把半透明黑色背景 UIButton 加入到 containerView 中，并且做一个 alpha 从0到1的渐变过渡动画。
     */
    override func presentationTransitionWillBegin() {
        cover.frame = containerView!.bounds
        containerView?.addSubview(cover)
        
        
        let coordinator = self.presentingViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ (context) -> Void in
            self.cover.alpha = 0.5
            }, completion: { (context) -> Void in
                
        })
    }
    
    /**
     是在呈现过渡结束时被调用的，并且该方法提供一个布尔变量来判断过渡效果是否完成。
     
     - parameter completed: 是否完成
     */
    override func presentationTransitionDidEnd(completed: Bool) {
        if !completed {
            containerView?.willRemoveSubview(cover)
        }
    }
    
    /**
     消失 - 转场动画要开始了
     */
    override func dismissalTransitionWillBegin() {
        let coordinator = self.presentingViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ (context) -> Void in
            self.cover.alpha = 0.0
            }, completion: { (context) -> Void in
                
        })
    }
    
    /**
     消失 - 转场动画要结束了
     
     - parameter completed: 是否完成
     */
    override func dismissalTransitionDidEnd(completed: Bool) {
        if !completed {
            containerView?.willRemoveSubview(cover)
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        let frame = self.containerView?.bounds
        
        cover.frame = frame!
        containerView?.insertSubview(cover, atIndex: 0)
        
        presentedView()?.frame = CGRectInset(frame!, 40, 200)
        
        
    }
    
    /**
     在我们的自定义呈现中，被呈现的 view 并没有完全完全填充整个屏幕，而是很小的一个矩形。被呈现的 view 的过渡动画之后的最终位置，是由 UIPresentationViewController 来负责定义的。我们重载 frameOfPresentedViewInContainerView 方法来定义这个最终位置
     
     - returns: CGRect
     */
//    override func frameOfPresentedViewInContainerView() -> CGRect {
//        let frame = self.containerView?.bounds
//        return CGRectInset(frame!, 40, 200)
//    }
    
}
