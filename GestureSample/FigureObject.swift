//
//  FigureObject.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/19.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import Foundation

protocol FigureObjectDelegate {
    func didSelectFigureObject(object: FigureObject)
    func didDeselectFigureObject(object: FigureObject)
}

class FigureObject: UIView, UIGestureRecognizerDelegate{
    var figureDelegate: FigureObjectDelegate?
    var isBlue: Bool!
    var currentTransForm: CGAffineTransform!
    var manageGestures: Array<UIGestureRecognizer>!
    
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
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapGestureAction:")))
        
        manageGestures = [UIGestureRecognizer]()
        isBlue = true;
    }
    
    func setOrigin(origin: CGPoint) {
        self.frame.origin = origin;
    }
    
    func setFigureDelegate(_delegate: FigureObjectDelegate) {
        self.figureDelegate = _delegate
    }
    
    func tapGestureAction(sender: UIPanGestureRecognizer) {
        self.backgroundColor = isBlue.boolValue ? .greenColor() : .blueColor()
        
        if let delegate = figureDelegate {
            if isBlue.boolValue {
                delegate.didSelectFigureObject(self)
            }
            else {
                delegate.didDeselectFigureObject(self)
            }
        }
        
        isBlue = !isBlue
    }
    
    func addManageGesture(gestureRecognizer: UIGestureRecognizer) {
        manageGestures.append(gestureRecognizer)
    }
    
    func getManageGestures() -> Array<UIGestureRecognizer>!{
        return manageGestures
    }
    
    func removeAllGestures() {
        for gesture in manageGestures {
            self.removeGestureRecognizer(gesture)
        }
        
        manageGestures.removeAll(keepCapacity: false)
    }
    
    func panGestureAction(sender: UIPanGestureRecognizer) {
        if let view = sender.view {
            var d = sender.translationInView(self)
            println(d)
            self.frame.origin.x += d.x
            self.frame.origin.y += d.y
            sender.setTranslation(CGPointZero, inView: view)
        }
    }
    
    func pinchGestureAction(sender: UIPinchGestureRecognizer) {
        
        var scale = sender.scale
        self.transform = CGAffineTransformScale(self.transform, scale, scale)
        
        sender.scale = 1
    }

}