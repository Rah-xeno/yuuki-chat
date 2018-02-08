//
//  dujLayer.swift
//  YuukiCha
//
//  Created by WuYueFeng on 2018/2/5.
//  Copyright © 2018年 rahxeno@gmail.com. All rights reserved.
//

import UIKit

class dujLayer: CALayer {

    func setFrame(rect:CGRect,bollRect:CGFloat,progressPoint:Int = 5) {
        self.frame = rect
        diameter = bollRect
        self.progressPoint = progressPoint + 2*(progressPoint - 1)
        centerPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        movePoint = CGPoint(x: centerPoint.x-diameter/2, y: centerPoint.y+diameter/2)
        lastPoint = movePoint
    }
    
    fileprivate var diameter:CGFloat = 0
    fileprivate var centerPoint:CGPoint = CGPoint(x: 0, y: 0)
    fileprivate var movePoint = CGPoint(x: 0, y: 0)
    fileprivate var progressPoint = 13
    
    fileprivate var direction = false  //to left = true
    fileprivate var changeDirection = false // to left = false
    
    
    func addOne(left:Bool) {
        direction = left
        
        lastPoint = movePoint
        changeDirection = true
        
        for i in 1...60 {
            var offset = diameter * ( CGFloat(i)/60 )
            if direction {
                offset = offset * -1
            }
            movePoint = CGPoint(x: lastPoint.x + offset, y: centerPoint.y+diameter/2)
            
            self.setNeedsDisplay()
        }
        
        changeDirection = false
        lastPoint = movePoint
        for i in 1...60 {
            var offset = diameter * ( CGFloat(i)/60 )
            if direction {
                offset = offset * -1
            }
            movePoint = CGPoint(x: lastPoint.x + offset, y: centerPoint.y+diameter/2)
            self.setNeedsDisplay()
        }
        
    }
    
    fileprivate var lastPoint:CGPoint = CGPoint(x: 0, y: 0)
    
    override func draw(in ctx: CGContext) {
        //外框
        let rect = CGRect.init(x: movePoint.x, y: movePoint.y, width: diameter, height: diameter)
        
        
        //移动时偏移量,最大为0.5倍宽度(30),最小为0
        let tempX = fabs(movePoint.x - lastPoint.x)
        var movedXDistance = tempX <= diameter/2 ? tempX : diameter/2
        
        if !changeDirection {
            movedXDistance = diameter/2 - movedXDistance
        }
        
        print(direction)
        //圆顺时针ABCD
        let pointA = CGPoint.init(x: rect.origin.x+rect.width/2, y: rect.origin.y)
        let pointB = CGPoint.init(x: direction ? rect.maxX+movedXDistance : rect.maxX, y: rect.origin.y+rect.height/2)//向左时B的x加长
        
        let pointC = CGPoint.init(x: pointA.x, y: rect.maxY)
        let pointD = CGPoint.init(x: direction ? rect.origin.x : rect.origin.x - movedXDistance, y: pointB.y)//向右时D的x减少
        
        
        //辅助点 offset为外框.3.6
        let offset = rect.width/3.6
        let litDistance = movedXDistance/10
        
        let ab = CGPoint(x: pointA.x+offset, y: pointA.y)
        let cb = CGPoint(x: pointC.x + offset, y: pointC.y)
        let cd = CGPoint(x: pointC.x - offset, y: pointC.y)
        let ad = CGPoint(x: pointA.x - offset, y: pointA.y)
        
        
        let ba = CGPoint(x: pointB.x, y: direction ? pointB.y - offset + litDistance : pointB.y - offset)
        //向左时ba的y增加一点,最大1/8长度到B点,设为1/10
        
        let bc = CGPoint(x: pointB.x, y: direction ? pointB.y + offset - litDistance : pointB.y + offset)
        
        let dc = CGPoint(x: pointD.x, y: direction ? pointD.y + offset : pointD.y + offset - litDistance)
        
        let da = CGPoint(x: pointD.x, y: direction ? pointD.y - offset : pointD.y - offset + litDistance)
        
        
        
        //画圆
        
        let ovalPath = UIBezierPath()
        ovalPath.move(to: pointA)
        ovalPath.addCurve(to: pointB, controlPoint1: ab, controlPoint2: ba)
        ovalPath.addCurve(to: pointC, controlPoint1: bc, controlPoint2: cb)
        ovalPath.addCurve(to: pointD, controlPoint1: cd, controlPoint2: dc)
        ovalPath.addCurve(to: pointA, controlPoint1: da, controlPoint2: ad)
        ovalPath.close()
        
        ctx.setFillColor(UIColor.magenta.cgColor)
        ctx.setStrokeColor(UIColor.white.cgColor)
        ctx.addPath(ovalPath.cgPath)
        
        ctx.drawPath(using: .fillStroke)
        
        ctx.setFillColor(UIColor.red.cgColor)
        
        for point in [pointA,pointB,pointC,pointD] {
            ctx.fill(CGRect(x: point.x, y: point.y, width: 2, height: 2))
        }
    }
}
