//
//  ShowViewController.swift
//  TestSnippets
//
//  Created by integrated on 12/29/15.
//  Copyright © 2015 integrated. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: CGRectMake(0, 0, 100, 100))
        label.text = "MadLife Dev"
        label.backgroundColor = UIColor.blueColor()
        label.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: "dismiss")
        label.addGestureRecognizer(tap)
        self.view.addSubview(label)    
        
        self.view.backgroundColor = UIColor.redColor()
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
