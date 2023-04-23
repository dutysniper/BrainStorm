//
//  HumanView.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 23.04.2023.
//

import UIKit

class ShapesView: UIView {
    
    let headLayer = CAShapeLayer()
    let rectangleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        UIColor.black.setStroke()
        
        headPath.lineWidth = 4.0
        headPath.stroke()
        
        headLayer.fillColor = .none

        headLayer.path = headPath.cgPath
  
        layer.addSublayer(headLayer)
        
        
        
        
        
        
//        let torsoPath = UIBezierPath()
//        torsoPath.move(to: CGPoint(x: center.x / 2, y: 10))
//
//        // Рисуем линию от начала туловища до верхнего конца грудной клетки
//        torsoPath.addLine(to: CGPoint(x: 100, y: 140))
//
//        // Рисуем кривую для верхней части груди
//        torsoPath.addQuadCurve(to: CGPoint(x: 150, y: 140), controlPoint: CGPoint(x: 125, y: 130))
//
//        // Рисуем линию для верхней части живота
//        torsoPath.addLine(to: CGPoint(x: 150, y: 180))
//
//        // Рисуем кривую для нижней части живота
//        torsoPath.addCurve(to: CGPoint(x: 200, y: 280), controlPoint1: CGPoint(x: 150, y: 210), controlPoint2: CGPoint(x: 225, y: 225))
//
//        // Рисуем линию для нижней части туловища
//        torsoPath.addLine(to: CGPoint(x: 200, y: 100))
//
//        // Закрываем контур туловища
//        torsoPath.close()
//
//        // Создаем слой CAShapeLayer
//        let torsoLayer = CAShapeLayer()
//        torsoLayer.path = torsoPath.cgPath
//        torsoLayer.fillColor = UIColor.red.cgColor
//        torsoLayer.strokeColor = UIColor.black.cgColor
//        torsoLayer.lineWidth = 2.0

        // Добавляем слой на UIView
        //layer.addSublayer(torsoLayer)
        
        
        
        
        
        
        let rectanglePath = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 100, height: 50))
        rectangleLayer.path = rectanglePath.cgPath
        rectangleLayer.fillColor = UIColor.red.cgColor
       // layer.addSublayer(rectangleLayer)
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
    
    func animateRectangle() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = rectangleLayer.position.x
        animation.toValue = rectangleLayer.position.x + 100
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.autoreverses = true
        rectangleLayer.add(animation, forKey: "position.x")
    }
}
