//
//  LineGraphSupport.swift
//  GraphTutorial
//
//  Created by 박찬웅 on 2017. 9. 12..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

@IBDesignable class LineGraphSupport: UIView {
    
    override func draw(_ rect: CGRect) {
        
        // data //
        
        let data = [1750,2300,2200,1400,1200,1000,1300]
        
        let topBorder = CGFloat(400)
        let bottomBorder = CGFloat(0)
        // X Axis //
        
        let XPoint = {(Column: Int) -> CGFloat in
            
            let spacer = rect.width / CGFloat(data.count - 1)
            let X = CGFloat(Column) * spacer
            
            return X
            
        }
        
        // Y Axis //
        let graphHeight = rect.height - topBorder - bottomBorder
        let maxValue = data.max()!
        
        let YPoint = {(graphPoint: Int) -> CGFloat in
            
            let Ydistance = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            let Y = graphHeight + topBorder - Ydistance
            
            return Y
            
        }
        
        // Line Graph //
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: XPoint(0), y: YPoint(data[0])))
        
        for i in 1..<data.count
        {
            let nextPoint = CGPoint(x: XPoint(i), y: YPoint(data[i]))
            
            if data[i] == 0 {
                
                linePath.addLine(to: nextPoint)
                
            } else {
                
                
                let midPoint = CGPoint(x: (XPoint(i-1) + XPoint(i)) / 2 , y: (YPoint(data[i-1]) + YPoint(data[i])) / 2)
                
                let diff = (YPoint(data[i]) - midPoint.y ) / 2
                
                let controlPoint1 = CGPoint(x: (XPoint(i-1) + midPoint.x) / 2, y: (YPoint(data[i-1]) + midPoint.y ) / 2 - diff)
                
                let controlPoint2 = CGPoint(x: (XPoint(i) + midPoint.x) / 2, y: (YPoint(data[i]) + midPoint.y ) / 2 + diff)
                
                linePath.addCurve(to: nextPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
                
            }
            
        }
        
        
        // Line Graph Background //
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()
        
        let clippintPath = linePath.copy() as! UIBezierPath
        
        clippintPath.addLine(to: CGPoint(x: XPoint(data.count - 1), y: rect.height))
        clippintPath.addLine(to: CGPoint(x: XPoint(0), y: rect.height))
        clippintPath.close()
        clippintPath.addClip()
        
        let higestYPoint = YPoint(maxValue)
        let startPoint = CGPoint(x: 0, y: higestYPoint)
        let endPoint = CGPoint(x: 0, y: self.bounds.height)
        let startColor = UIColor(red: 230/255, green: 220/255, blue: 30/255, alpha: 1.0)
        let endColor = UIColor(red: 70/255, green: 70/255, blue: 10/255, alpha: 1.0)
        let colors = [startColor.cgColor,endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations = [CGFloat(0.0),CGFloat(1.0)]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        
        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .init(rawValue: UInt32(0)))
        
        
        context!.restoreGState()
        
        
        UIColor.white.setStroke()
        linePath.lineWidth = 1
        linePath.stroke()
        
        // Label //
        let labelPath = UIBezierPath()
        
        labelPath.move(to: CGPoint(x: XPoint(2), y: topBorder - 85))
        labelPath.addLine(to: CGPoint(x: XPoint(2), y: topBorder - 20))
        
        labelPath.move(to: CGPoint(x: XPoint(4), y: topBorder - 85))
        labelPath.addLine(to: CGPoint(x: XPoint(4), y: topBorder - 20))
        
        UIColor(red: 230/255, green: 220/255, blue: 30/255, alpha: 1.0).setStroke()
        labelPath.lineWidth = 1
        labelPath.stroke()
        
        let maxDay = viewWithTag(1) as! UILabel
        maxDay.center = CGPoint(x: XPoint(3), y: topBorder - 75)
        
        let max = viewWithTag(2) as! UILabel
        max.center = CGPoint(x: XPoint(3), y: topBorder - 45)
        max.text = "\(data.max()!)"
        
        
        let firstDayLabel = viewWithTag(3) as! UILabel
        firstDayLabel.center = CGPoint(x: XPoint(0) + 8, y: rect.height - bottomBorder - 10)
        
        let lastDayLabel = viewWithTag(9) as! UILabel
        lastDayLabel.center = CGPoint(x: XPoint(data.count-1) - 8, y: rect.height - bottomBorder - 10)
        
        
        
        
        for i in 4...8 {
            let dayLabel = viewWithTag(i) as! UILabel
            dayLabel.center = CGPoint(x: XPoint(i - 3), y: rect.height - bottomBorder - 10)
        }

    }
}







