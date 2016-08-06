//
//  ViewController.swift
//  BasicTapAnimation
//
//  Created by Luis Arias on 27/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

enum FaceState {
    case FirstLevelExpanded
    case SecondLevelExpanded
    case ThirdLevelExpanded
}

class ViewController: UIViewController {
    
    var swipeUp = UISwipeGestureRecognizer()
    var swipeDown = UISwipeGestureRecognizer()
    
    @IBOutlet var berreandoImage: UIImageView!
    @IBOutlet var felizImage: UIImageView!
    
    
    @IBOutlet var leftView: UIView!
    @IBOutlet var rightView: UIView!
    
//    var isBerreando = false
//    var isFeliz = false
    
    var currentFace: FaceState = .FirstLevelExpanded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTapGestureRecognizer(leftView, action: #selector(tappedLeftView))
        self.setupTapGestureRecognizer(rightView, action: #selector(tappedRightView))
        self.setupSwipeUp()
        self.setupSwipeDown()

    }
    
    override func viewDidAppear(animated: Bool) {
        self.setupImages()
    }
    
    func setupImages() {
        self.berreandoImage.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.felizImage.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
    }
    
    
    func setupTapGestureRecognizer(v: UIView, action: Selector) {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: action)
        v.addGestureRecognizer(tap)
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
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                if self.currentFace == .SecondLevelExpanded {
                    self.berreandoImage.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
                    self.felizImage.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
                    self.currentFace = .FirstLevelExpanded
                }
            }, completion: {
                animationFinished in
                print("Animation has finished")
        })
    }
    
    func swippedDown() {
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                if self.currentFace == .FirstLevelExpanded {
                    self.felizImage.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
                    self.berreandoImage.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
                    self.currentFace = .SecondLevelExpanded
                }
            }, completion: {
                animationFinished in
                print("Animation has finished")
        })
    }
    
    func tappedRightView() {
        
        let screenHeight = self.view.frame.size.height
        let screenWidth = self.view.frame.size.width
        
        let size : CGFloat = CGFloat(arc4random_uniform(40)) + 40
        let xPositon : CGFloat = CGFloat(arc4random_uniform(UInt32(screenWidth))) - 25
        let yFinalPosition : CGFloat = CGFloat(arc4random_uniform(UInt32(screenHeight))) - (screenHeight/2)
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveLinear
        let square = UIImageView(image: UIImage(named: "feliz"))
        
        square.frame = CGRect(x: xPositon, y: screenHeight, width: size, height: size)
        
        self.view.addSubview(square)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            square.alpha = 0.0
            square.frame = CGRect(x: xPositon, y: yFinalPosition, width: size, height: size)
            }, completion: { animationFinished in
                square.removeFromSuperview()
        })

    }
    
    func tappedLeftView() {
        
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

