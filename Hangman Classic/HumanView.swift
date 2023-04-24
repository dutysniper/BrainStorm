//
//  HumanView.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 23.04.2023.
//

import UIKit

final class HumanView: UIView {

    private let headLayer = CAShapeLayer()
    private let torsoLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let height = frame.height
        let width = frame.width
        let center = CGPoint(x: width / 2, y: height / 2)
        UIColor.systemGray6.setStroke()
        
      
        
        
        // MARK: DRAWIND HEAD
        let headPath = UIBezierPath()
        
        let headStart = CGPoint(x: center.x, y: center.y * 0.25)
        headPath.move(to: headStart)
        headPath.addCurve(
            to: CGPoint(x: center.x, y: center.y * 0.45),
            controlPoint1: CGPoint(x: center.x * 1.22, y: center.y * 0.26),
            controlPoint2: CGPoint(x: center.x * 1.11, y: center.y * 0.458)
        )
        headPath.addCurve(
            to: headStart,
            controlPoint1: CGPoint(x: center.x * 0.89, y: center.y * 0.458),
            controlPoint2: CGPoint(x: center.x * 0.78, y: center.y * 0.26)
        )
        
        
        
        headPath.lineWidth = 2.0
        headPath.stroke()
        
        headLayer.fillColor = .none
        
        headLayer.path = headPath.cgPath
        
        layer.addSublayer(headLayer)
        
        
        
        // MARK: DRAWIND TORSO
        let torsoPath = UIBezierPath()
        
        let torsoStart = CGPoint(x: center.x, y: center.y * 0.47)
        torsoPath.move(to: torsoStart)
        torsoPath.addCurve(
            to: CGPoint(x: center.x * 1.16, y: center.y * 0.74),
            controlPoint1: CGPoint(x: center.x * 1.22, y: center.y * 0.42),
            controlPoint2: CGPoint(x: center.x * 1.20, y: center.y * 0.658)
        )
        torsoPath.addCurve(
            to: CGPoint(x: center.x, y: center.y * 0.88),
            controlPoint1: CGPoint(x: center.x * 1.15, y: center.y * 0.77),
            controlPoint2: CGPoint(x: center.x * 1.1, y: center.y * 0.87)
        )
        torsoPath.addCurve(
            to: CGPoint(x: center.x * 0.84, y: center.y * 0.74),
            controlPoint1: CGPoint(x: center.x * 0.9, y: center.y * 0.87),
            controlPoint2: CGPoint(x: center.x * 0.85, y: center.y * 0.77)
        )
        torsoPath.addCurve(
            to: torsoStart,
            controlPoint1: CGPoint(x: center.x * 0.8, y: center.y * 0.658),
            controlPoint2: CGPoint(x: center.x * 0.78, y: center.y * 0.42)
        )
        
        
        torsoPath.lineWidth = 2.0
        torsoPath.stroke()
        
        torsoLayer.fillColor = .none
        
        torsoLayer.path = torsoPath.cgPath
        
        layer.addSublayer(torsoLayer)
        
    }
    
    func animateCircle() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 1.5
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.autoreverses = true
        headLayer.add(animation, forKey: "scale")
    }
    
    
}

