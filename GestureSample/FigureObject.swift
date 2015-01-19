//
//  FigureObject.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/19.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class FigureObject: UIView, UIGestureRecognizerDelegate{
    
    var isBlue: Bool!
    
    override init() {
        super.init()
        initiallize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiallize()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initiallize() {
        self.backgroundColor = .blueColor()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tappedAction")))
        
        isBlue = true;
    }
    
    func setOrigin(origin: CGPoint) {
        self.frame.origin = origin;
    }
    
    func tappedAction() {
        self.backgroundColor = isBlue.boolValue ? .greenColor() : .blueColor()
        isBlue = !isBlue
    }
}