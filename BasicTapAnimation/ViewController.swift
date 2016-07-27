//
//  ViewController.swift
//  BasicTapAnimation
//
//  Created by Luis Arias on 27/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func animateButtonPressed(sender: UIButton) {
        let square = UIView()
        
        square.backgroundColor = UIColor.redColor()
        square.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        
        self.view.addSubview(square)
        
        UIView.animateWithDuration(1.0, animations: {
            square.backgroundColor = UIColor.blueColor()
            
            square.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            }, completion: { animationFinished in
                square.removeFromSuperview()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

