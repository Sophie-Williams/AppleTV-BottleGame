//
//  ViewController.swift
//  BottleGame
//
//  Created by Anton Kondrashov on 25/11/2016.
//  Copyright © 2016 Anton Kondrashov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

  
  @IBOutlet weak var spinBottleButton: UIButton!
  
  @IBAction func actionButtonTap(_ sender: UIButton) {
    spinBottle()
    spinBottleButton.isEnabled = false
  }
  @IBOutlet var labels: [UILabel]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let playersNumber = UserDefaults().integer(forKey: "players")
    for label in labels!{
      let num = Int(label.text ?? "2")!
      label.isHidden = num > playersNumber
    }
    
  }
  
  func spinBottle(){
    let rotateView = CABasicAnimation()
    let randonAngle = arc4random_uniform(360) + 720
    rotateView.fromValue = 0
    rotateView.toValue = Float(randonAngle) * Float(M_PI) / 180.0
    rotateView.duration = 3
    rotateView.repeatCount = 0
    rotateView.delegate = self
    rotateView.isRemovedOnCompletion = false
    rotateView.fillMode = kCAFillModeForwards
    rotateView.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    spinBottleButton.layer.add(rotateView, forKey: "transform.rotation.z")
  }

  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    spinBottleButton.isEnabled = true
  }

}
