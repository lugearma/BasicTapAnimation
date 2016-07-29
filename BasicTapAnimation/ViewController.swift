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
        
        let screenHeight = self.view.frame.size.height
        let screenWidth = self.view.frame.size.width
        
        let size : CGFloat = CGFloat(arc4random_uniform(40)) + 20
        let xPositon : CGFloat = CGFloat(arc4random_uniform(UInt32(screenWidth))) - 20
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveEaseIn
        let square = UIView()
        
        square.backgroundColor = UIColor.redColor()
        square.frame = CGRect(x: xPositon, y: screenHeight, width: size, height: size)

        self.view.addSubview(square)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            square.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.0)
            
            square.frame = CGRect(x: xPositon, y: 0, width: size, height: size)
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

