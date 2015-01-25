//
//  RectangleView.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/19.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import Foundation

class RectangleView : FigureObject {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}