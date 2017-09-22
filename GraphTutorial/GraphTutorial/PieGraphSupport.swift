//
//  PieGraphSupport.swift
//  GraphTutorial
//
//  Created by 박찬웅 on 2017. 9. 18..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

@IBDesignable class PieGraphSupport: UIView {

    override func draw(_ rect: CGRect) {
        
        
        // Variable //
        
        let center = CGPoint(x: (rect.width / 2), y: (rect.height * 2 / 3))
        let graphWidth = CGFloat(30)
        let walkCalorieRadius = CGFloat(100)
        let runCalorieRadius = CGFloat(70)
        let workoutCalorieRadius = CGFloat(40)
        
        let π = CGFloat(Double.pi)
        let startAngle = CGFloat(-0.5 * π)
        let endAngle = CGFloat(1.5 * π)
        
        var walkCalorieEndAngle = CGFloat()
        var runCalorieEndAngle = CGFloat()
        var workoutCalorieEndAngle = CGFloat()
        
        
        // Data //
        
        let totalColorie = CGFloat(2000)
        let walkCalorie = CGFloat(800)
        let runCalorie = CGFloat(400)
        let workoutCalorie = CGFloat(800)
        
        walkCalorieEndAngle = startAngle + (walkCalorie / totalColorie * 2 * π)
        runCalorieEndAngle = startAngle + (runCalorie / totalColorie * 2 * π)
        workoutCalorieEndAngle = startAngle + (workoutCalorie / totalColorie * 2 * π)
        
        // Pie Graph BackGround //
        
        let walkCalorieBGPath = UIBezierPath(arcCenter: center, radius: walkCalorieRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        walkCalorieBGPath.lineWidth = graphWidth
        UIColor(red: 33/255, green: 0/255, blue: 3/255, alpha: 1.0).setStroke()
        walkCalorieBGPath.stroke()
        
        let runCalorieBGPath = UIBezierPath(arcCenter: center, radius: runCalorieRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        runCalorieBGPath.lineWidth = graphWidth
        UIColor(red: 9/255, green: 33/255, blue: 1/255, alpha: 1.0).setStroke()
        runCalorieBGPath.stroke()
        
        let workoutCalorieBGPath = UIBezierPath(arcCenter: center, radius: workoutCalorieRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        workoutCalorieBGPath.lineWidth = graphWidth
        UIColor(red: 1/255, green: 28/255, blue: 33/255, alpha: 1.0).setStroke()
        workoutCalorieBGPath.stroke()
        
        // pie Graph //
        
        let walkCaloriePath = UIBezierPath(arcCenter: center, radius: walkCalorieRadius, startAngle: startAngle, endAngle: walkCalorieEndAngle, clockwise: true)
        
        walkCaloriePath.lineWidth = graphWidth
        walkCaloriePath.lineCapStyle = .round
        UIColor(red: 223/255, green: 12/255, blue: 36/255, alpha: 1.0).setStroke()
        walkCaloriePath.stroke()
        
        let runCaloriePath = UIBezierPath(arcCenter: center, radius: runCalorieRadius, startAngle: startAngle, endAngle: runCalorieEndAngle, clockwise: true)
        
        runCaloriePath.lineWidth = graphWidth
        runCaloriePath.lineCapStyle = .round
        UIColor(red: 70/255, green: 220/255, blue: 40/255, alpha: 1.0).setStroke()
        runCaloriePath.stroke()

        
        let workoutCaloriePath = UIBezierPath(arcCenter: center, radius: workoutCalorieRadius, startAngle: startAngle, endAngle: workoutCalorieEndAngle, clockwise: true)
        
        workoutCaloriePath.lineWidth = graphWidth
        workoutCaloriePath.lineCapStyle = .round
        UIColor(red: 30/255, green: 190/255, blue: 220/255, alpha: 1.0).setStroke()
        workoutCaloriePath.stroke()
        
        
        // Layer Line //
        
        let walkCalorieLayerLinePath = UIBezierPath(arcCenter: center, radius: walkCalorieRadius - graphWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let walkCalorieLayer = CAShapeLayer()
        walkCalorieLayer.path = walkCalorieLayerLinePath.cgPath
        walkCalorieLayer.strokeColor = UIColor.black.cgColor
        walkCalorieLayer.fillColor = UIColor.clear.cgColor
        walkCalorieLayer.lineWidth = 1
        self.layer.addSublayer(walkCalorieLayer)
        
        
        let runCalorieLayerLinePath = UIBezierPath(arcCenter: center, radius: runCalorieRadius - graphWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let runCalorieLayer = CAShapeLayer()
        runCalorieLayer.path = runCalorieLayerLinePath.cgPath
        runCalorieLayer.strokeColor = UIColor.black.cgColor
        runCalorieLayer.fillColor = UIColor.clear.cgColor
        runCalorieLayer.lineWidth = 1
        self.layer.addSublayer(runCalorieLayer)
        
        
        
        // Label //
        
        let walk = viewWithTag(10) as! UIButton
        walk.center = CGPoint(x: rect.width / 2, y: (rect.height * 2 / 3) - walkCalorieRadius)
        
        let run = viewWithTag(11) as! UIButton
        run.center = CGPoint(x: rect.width / 2, y: (rect.height * 2 / 3) - runCalorieRadius)
        
        let workout = viewWithTag(12) as! UIButton
        workout.center = CGPoint(x: rect.width / 2, y: (rect.height * 2 / 3) - workoutCalorieRadius)


    }

}
