//
//  ViewController.swift
//  BasicTapAnimation
//
//  Created by Luis Arias on 27/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var swipeUp = UISwipeGestureRecognizer()
    var swipeDown = UISwipeGestureRecognizer()
    var tap = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapGestureRecognizer()
        setupSwipeUp()
        setupSwipeDown()
    }
    
    func setupTapGestureRecognizer() {
        self.tap.addTarget(self, action: #selector(tapped))
        self.view.addGestureRecognizer(tap)
    }
    
    func setupSwipeDown(){
        self.swipeDown.addTarget(self, action: #selector(swippedDown))
        self.swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(self.swipeDown)
    }
    
    func setupSwipeUp() {
        self.swipeUp.addTarget(self, action: #selector(swippedUp))
        self.swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(self.swipeUp)
    }
    
    func swippedUp() {
        print("up")
    }
    
    func swippedDown() {
        print("down")
    }
    
    func tapped() {
        
        let screenHeight = self.view.frame.size.height
        let screenWidth = self.view.frame.size.width
        
        let size : CGFloat = CGFloat(arc4random_uniform(40)) + 40
        let xPositon : CGFloat = CGFloat(arc4random_uniform(UInt32(screenWidth))) - 25
        let yFinalPosition : CGFloat = CGFloat(arc4random_uniform(UInt32(screenHeight))) - (screenHeight/2)
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveLinear
        let square = UIImageView(image: UIImage(named: "berreando"))
        
        square.frame = CGRect(x: xPositon, y: screenHeight, width: size, height: size)
        
        self.view.addSubview(square)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            square.alpha = 0.0
            square.frame = CGRect(x: xPositon, y: yFinalPosition, width: size, height: size)
            }, completion: { animationFinished in
                square.removeFromSuperview()
        })
        
    }
    
    
}

