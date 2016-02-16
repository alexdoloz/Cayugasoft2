//
//  GraphView.swift
//  CayugasoftTest2
//
//  Created by Alexander on 16.02.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

typealias FunctionType = (Double) -> Double

class GraphView: UIView {
    var f: FunctionType! = { $0 }
    let graphOrigin = CGPoint(x: 100, y: 500)
    
    override func drawRect(rect: CGRect) {
        changeCTM()
        let step = 1.0
        let start = 0.0
        let end = Double(self.bounds.size.width)
        
        var x = start
        var y = f(x)
        let path = UIBezierPath()
        
        path.moveToPoint(CGPoint(x: x, y: y))
        while x <= end {
            y = f(x)
            path.addLineToPoint(CGPoint(x: x, y: y))
            x += step
        }
        UIColor.blueColor().setStroke()
        path.lineWidth = 3.0
        path.stroke()
        
        createHorizontalAxis()
        createVerticalAxis()
    }
    
    func changeCTM() {
        let ctx = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(ctx, graphOrigin.x, graphOrigin.y)
        CGContextScaleCTM(ctx, 1.0, -1.0)
    }
    
    func createHorizontalAxis() {
        let axis = UIBezierPath()
        axis.moveToPoint(CGPoint(x: -1000.0, y: 0))
        axis.addLineToPoint(CGPoint(x: 1000, y: 0))
        strokeAxis(axis)
    }
    
    func createVerticalAxis() {
        let axis = UIBezierPath()
        axis.moveToPoint(CGPoint(x: 0.0, y: -1000.0))
        axis.addLineToPoint(CGPoint(x: 0.0, y: 1000.0))
        strokeAxis(axis)
    }
    
    func strokeAxis(axis: UIBezierPath) {
        UIColor.grayColor().setStroke()
        axis.lineWidth = 2.0
        axis.stroke()
    }
    
    func convertPointFromGraphToView(point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + graphOrigin.x, y: -point.y + graphOrigin.y)
    }
}
