//
//  ViewController.swift
//  Codevember_Contrast(01.11.19)
//
//  Created by Edgar Sgroi on 01/11/19.
//  Copyright © 2019 Edgar Sgroi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let aPath = UIBezierPath()
    let myShapeLayer = CAShapeLayer()
    
    var rotateRight: Bool = false

    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(Float.random(in: 0...2)), repeats: true, block: {_ in
            self.createLines()
        })
    }
    
    func moveTo(path: UIBezierPath, x: CGFloat, y: CGFloat) {
        
        path.move(to: CGPoint(x: x, y: y))
        
    }
    
    func addLine(path: UIBezierPath, x: CGFloat, y: CGFloat){
        path.addLine(to: CGPoint(x: x, y: y))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if self.rotateRight {
           self.rotateRight = false
        } else {
            self.rotateRight = true
        }
        createLines(touch: touch)
    }
    
    func createLines(touch: UITouch){
        let path = UIBezierPath()
        let location = touch.location(in: self.view)
        let x = location.x
        let y = location.y
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: self.view.frame.maxX + 100, y: y)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: x, y: self.view.frame.maxY + 100)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: self.view.frame.minX - 100, y: y)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: x, y: self.view.frame.minY - 270)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 0.1
        view.layer.addSublayer(shapeLayer)
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.1
        myEndAnimation.toValue = 2
        
        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 1.0

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        animationGroup.repeatDuration = .infinity
        
        
        shapeLayer.add(animationGroup, forKey: "drawLine")
        shapeLayer.add(animationGroup, forKey: "drawLine")
    }
    
    func createLines(){
        
        let path = UIBezierPath()
        let x = CGFloat.random(in: self.view.frame.minX...self.view.frame.maxX)
        let y = CGFloat.random(in: self.view.frame.minY...self.view.frame.maxY)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: self.view.frame.maxX + 100, y: y)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: x, y: self.view.frame.maxY + 100)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: self.view.frame.minX - 100, y: y)
        moveTo(path: path, x: x, y: y)
        addLine(path: path, x: x, y: self.view.frame.minY - 270)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 0.1
        view.layer.addSublayer(shapeLayer)
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.1
        myEndAnimation.toValue = 2
        
        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 1.0

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        animationGroup.repeatDuration = .infinity
        
        
        shapeLayer.add(animationGroup, forKey: "drawLine")
        shapeLayer.add(animationGroup, forKey: "drawLine")
    }
}

