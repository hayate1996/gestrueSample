//
//  EllipseView.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/20.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import Foundation

class EllipseView : FigureObject {
    init(origin: CGPoint, radius: CGFloat) {
        super.init(frame: CGRectMake(origin.x, origin.y, radius, radius))
        self.layer.cornerRadius = radius * 0.5
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}