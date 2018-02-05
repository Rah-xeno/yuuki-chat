//
//  chatView.swift
//  YuukiCha
//
//  Created by WuYueFeng on 2018/2/5.
//  Copyright © 2018年 rahxeno@gmail.com. All rights reserved.
//

import UIKit

class chatView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.init(red: 116/255, green: 236/255, blue: 144/255, alpha: 1)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 
}
