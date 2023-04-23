//
//  HumanView.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 23.04.2023.
//

import UIKit

@IBDesignable
final class HumanView: UIView {
    
    private let headLayer = CAShapeLayer()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .clear
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func draw(_ rect: CGRect) {
        let height = frame.height
        let width = frame.width
        let center = CGPoint(x: width / 2, y: height / 2)
        
        // MARK: DRAWIND HEAD
        let headPath = UIBezierPath()
        
        let headStart = CGPoint(x: center.x, y: center.y * 0.06)
        headPath.move(to: headStart)
        headPath.addCurve(
            to: CGPoint(x: center.x, y: center.y * 0.26),
            controlPoint1: CGPoint(x: center.x * 1.22, y: center.y * 0.06),
            controlPoint2: CGPoint(x: center.x * 1.11, y: center.y * 0.258)
        )
        headPath.addCurve(
            to: headStart,
            controlPoint1: CGPoint(x: center.x * 0.89, y: center.y * 0.258),
            controlPoint2: CGPoint(x: center.x * 0.78, y: center.y * 0.06)
        )
        
        UIColor.white.setStroke()
        
        headPath.lineWidth = 2.0
        headPath.stroke()
        
        headLayer.fillColor = .none
        
        headLayer.path = headPath.cgPath
        
        layer.addSublayer(headLayer)
        
        
        //    func animateCircle() {
        //        let animation = CABasicAnimation(keyPath: "transform.scale")
        //        animation.fromValue = 1
        //        animation.toValue = 1.5
        //        animation.duration = 1
        //        animation.repeatCount = .infinity
        //        animation.autoreverses = true
        //        headLayer.add(animation, forKey: "scale")
        //    }
        //
        //    func animateRectangle() {
        //        let animation = CABasicAnimation(keyPath: "position.x")
        //        animation.fromValue = rectangleLayer.position.x
        //        animation.toValue = rectangleLayer.position.x + 100
        //        animation.duration = 1
        //        animation.repeatCount = .infinity
        //        animation.autoreverses = true
        //        rectangleLayer.add(animation, forKey: "position.x")
        //    }
    }
}
