//
//  chatLayer.swift
//  YuukiCha
//
//  Created by WuYueFeng on 2018/2/5.
//  Copyright © 2018年 rahxeno@gmail.com. All rights reserved.
//

import UIKit

class chatLayer: CALayer {
    
    var msg:Message!{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(msg:Message) {
        self.init()
        self.msg = msg
    }
    
    
    override func draw(in ctx: CGContext) {
//
//        let rect = self.bounds
//        let pointA = CGPoint.init(x: rect.width/2, y: 0)
//        let pointB = CGPoint.init(x: 0, y: rect.height/2)
//        let controlPoint = CGPoint.init(x: pointA.x*4/5, y: pointB.y*3/5)
//        //标记辅助点 蓝色
//        ctx.setFillColor(UIColor.red.cgColor)
//        for point in [pointA,pointB,controlPoint] {
//            ctx.fill(CGRect(x: point.x, y: point.y, width: 2, height: 2))
//        }
        
//        let ovalPath = UIBezierPath()
//        ovalPath.move(to: pointA)
//        ovalPath.addQuadCurve(to: pointB, controlPoint: controlPoint)
        //ovalPath.addCurve(to: pointB, controlPoint1: ab, controlPoint2: ba)
        //ovalPath.close()

        //print(msg.content)
        let string = NSMutableAttributedString.init(string: "  ○ "+msg.content!)
        string.addAttribute(NSAttributedStringKey.foregroundColor,value: UIColor.white, range: NSRange(location: 4, length: string.length-4))
        let components = msg.color.cgColor.components!
        //UIColor.init(hue: <#T##CGFloat#>, saturation: <#T##CGFloat#>, brightness: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        string.addAttribute(NSAttributedStringKey.foregroundColor,value: UIColor.init(red: components[0]-15/255, green: components[1]-15/255, blue: components[2]-15/255, alpha: 1), range: NSRange(location: 0, length: 3))
        string.addAttribute(NSAttributedStringKey.font,value:UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.bold), range: NSRange(location: 0, length: string.length))
        //msg.path.reversed.draw(string)
        msg.path.reversed.drawAttributedStringInLayer(string: string, context: ctx)
    }
}


