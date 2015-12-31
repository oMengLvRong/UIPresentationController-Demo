//
//  ViewController.swift
//  TestSnippets
//
//  Created by integrated on 12/28/15.
//  Copyright © 2015 integrated. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func jump(sender: AnyObject) {
        let vc = ShowViewController()
        vc.transitioningDelegate = transitionDelegate
        vc.modalPresentationStyle = .Custom
        presentViewController(vc, animated: true, completion: nil)
    }
    
    let transitionDelegate = PopAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

