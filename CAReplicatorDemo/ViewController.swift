//
//  ViewController.swift
//  CAReplicatorDemo
//
//  Created by Элина Рупова on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        
        self.view.layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
        startAnim(delay: 0.1, replicates: 30)
    }
    
    override func viewWillLayoutSubviews() {
        replicatorLayer.frame = self.view.bounds
        replicatorLayer.position = self.view.center
        
        sourceLayer.frame = CGRect(x: 0.0, y: 0.0, width: 3, height: 17)
        sourceLayer.backgroundColor = UIColor.white.cgColor
        sourceLayer.position = self.view.center
        sourceLayer.anchorPoint = CGPoint(x: 0, y: 5)
        
    }
    
    func startAnim(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        let angle = CGFloat(2 * Double.pi) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates) * delay
        opacityAnimation.repeatCount = Float.infinity
        sourceLayer.add(opacityAnimation, forKey: nil)
    }


}

