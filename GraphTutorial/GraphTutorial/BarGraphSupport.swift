//
//  BarGraphSupport.swift
//  GraphTutorial
//
//  Created by 박찬웅 on 2017. 9. 12..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

@IBDesignable class BarGraphSupport: UIView {
    
    override func draw(_ rect: CGRect) {
        
        
        // Data //
        let data = [10,50,80,0,0,0,0,0,60,120,150,200,140,70,60,30,20,50,100,130,150,70,130,120]
        
        // Support Line //
        let supportPath = UIBezierPath()
        
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 110))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 110))
        
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 160))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 160))
        
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 210))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 210))
        
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 260))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 260))
        
        UIColor.gray.setStroke()
        supportPath.lineWidth = 0.5
        supportPath.stroke()
        
        // Bar Graph BackGround //
        let xDistance = CGFloat((rect.width - 60) / 23)
        
        let graphBackgroundPath = UIBezierPath()
        
        for i in 0...23 {
            
            graphBackgroundPath.move(to: CGPoint(x: 30 + (xDistance * CGFloat(i)), y: bounds.height - 60))
            graphBackgroundPath.addLine(to: CGPoint(x: 30 + (xDistance * CGFloat(i)), y: bounds.height - 64))
        }
        
        graphBackgroundPath.move(to: CGPoint(x: 30, y: bounds.height - 60))
        graphBackgroundPath.addLine(to: CGPoint(x: 30, y: bounds.height - 64))
        
        UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1.0).setStroke()
        graphBackgroundPath.lineWidth = 2
        graphBackgroundPath.stroke()
        
        // Bar Graph //
        let graphPath = UIBezierPath()
        
        for i in 0...23 {
            graphPath.move(to: CGPoint(x: 30 + (xDistance * CGFloat(i)), y: bounds.height - 60))
            graphPath.addLine(to: CGPoint(x: 30 + (xDistance * CGFloat(i)), y: bounds.height - 60 - CGFloat(data[i])))
        }
        
        UIColor(red: 220/255, green: 10/255, blue: 30/255, alpha: 1.0).setStroke()
        graphPath.lineWidth = 2
        graphPath.stroke()
    }

    
    
    

}
