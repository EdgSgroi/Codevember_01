//
//  Dot.swift
//  Codevember_Contrast(01.11.19)
//
//  Created by Edgar Sgroi on 01/11/19.
//  Copyright © 2019 Edgar Sgroi. All rights reserved.
//

import Foundation
import UIKit

class Dot: UIView {
    
    let path = UIBezierPath()
    let view: UIView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLines() {
        moveTo(path: path, x: self.view.frame.minX + 20, y: self.view.frame.maxY - 20)
        addLine(path: path, x: self.view.frame.maxX/7, y: self.view.frame.maxY - 100)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 0.1
        
        //Criamos a animação que desenha
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 10.0

        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 2

        shapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(shapeLayer)
        }

    func moveTo(path: UIBezierPath, x: CGFloat, y: CGFloat) {
        
        path.move(to: CGPoint(x: x, y: y))
        
    }
    
    func addLine(path: UIBezierPath, x: CGFloat, y: CGFloat){
        path.addLine(to: CGPoint(x: x, y: y))
    }
    
}
