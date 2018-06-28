//
//  ViewController.swift
//  gestures2
//
//  Created by Dilip Kumar on 27/06/18.
//  Copyright © 2018 Dilip Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var pinchView: UIView!
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var rotation: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftAction(swipe:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftAction(swipe:)))
     swipeLeft.direction = .left
       swipeRight.direction = .right
        swipeView.addGestureRecognizer(swipeLeft)
        swipeView.addGestureRecognizer(swipeRight)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(tap:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapView.addGestureRecognizer(tapGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateAction(rotate:)))
        rotation.addGestureRecognizer(rotateGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(sender:)))
        pinchView.addGestureRecognizer(pinchGesture)
        
        let longpressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longpressAction(sender:)))
        longpressGesture.minimumPressDuration = 5
        longPressView.addGestureRecognizer(longpressGesture)
    }
    
    @objc func longpressAction(sender: UILongPressGestureRecognizer) {
        print("Long Press")
    }
    
    @objc func pinchAction(sender: UIPinchGestureRecognizer) {
        
        self.pinchView.transform = self.pinchView.transform.scaledBy(x: sender.scale, y: sender.scale)
                   print(sender.scale)
       
             sender.scale = 1
        
        
//        if sender.state == .began {
//            print("state began")
//        }
//        if sender.state == .changed {
//            self.pinchView.transform = self.pinchView.transform.scaledBy(x: sender.scale, y: sender.scale)
//            print(sender.scale)
//            sender.scale = 1
//        }
//        if sender.state == .ended {
//            sender.scale = 1
//        }
    }
    
    @objc func rotateAction(rotate: UIRotationGestureRecognizer) {
        print("rotated")
        if (rotate.state == .began) {
            print("began rotating")
        }
        if (rotate.state == .changed) {
            print(rotate.rotation)
            UIView.animate(withDuration: 1) {
                self.rotation.transform = self.rotation.transform.rotated(by: rotate.rotation)
            }
            
            
        }
        if (rotate.state == .ended) {
            print("ended Rotating")
        }
        
    }
    
    @objc func swipeLeftAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction {
        case .left:
            print("Left swiped")
            break
        case .right:
            print("Right swiped")
        default:
            print("This wasn't choice")
        }
    }
    
    @objc func tapGestureAction(tap: UITapGestureRecognizer) {
        print("Some One tapped on screen")
    }


}

