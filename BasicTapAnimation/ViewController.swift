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
        
        let size : CGFloat = CGFloat(arc4random_uniform(40)) + 20
        let yPositon : CGFloat = CGFloat(arc4random_uniform(200)) + 20
        let duration = 1.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveLinear
        let square = UIView()
        
        square.backgroundColor = UIColor.redColor()
        square.frame = CGRect(x: 0, y: yPositon, width: size, height: size)
        
        self.view.addSubview(square)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            square.backgroundColor = UIColor.blueColor()
            
            square.frame = CGRect(x: 320-50, y: yPositon, width: size, height: size)
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

