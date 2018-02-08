//
//  Message.swift
//  YuukiCha
//
//  Created by WuYueFeng on 2018/2/5.
//  Copyright © 2018年 rahxeno@gmail.com. All rights reserved.
//

import Foundation
class Message {
    var content:String!
    var author:String!
    var avatar:String!
    var color:UIColor!
    
    convenience init(content:String,author:String,avatar:String,color:UIColor) {
        self.init()
        self.content = content
        self.author = author
        self.avatar = avatar
        self.color = color
    }
    
    var path:UIBezierPath!
}
