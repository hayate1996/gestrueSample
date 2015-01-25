//
//  ViewController.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/19.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, FigureObjectDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var figure1 = EllipseView(origin: CGPointMake(100, 100), radius: 100)
        figure1.setFigureDelegate(self)
        self.view.addSubview(figure1)
        
        var figure2 = RectangleView(frame: CGRectMake(100, 300, 80, 80))
            figure2.setFigureDelegate(self)
        self.view.addSubview(figure2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addGestureRecognizersToView(view: FigureObject) {
        var panGestureRecognizer = UIPanGestureRecognizer(target: view, action: Selector("panGestureAction:"))
        var pinchGestureRecognizer = UIPinchGestureRecognizer(target: view, action: Selector("pinchGestureAction:"))
        panGestureRecognizer.delegate = self
        pinchGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(panGestureRecognizer)
        self.view.addGestureRecognizer(pinchGestureRecognizer)
        
        view.addManageGesture(panGestureRecognizer)
        view.addManageGesture(pinchGestureRecognizer)
    }

    func removeGestureRecognizersFromView(view: FigureObject) {
        var managedGestures = view.getManageGestures()
        
        for gesture in managedGestures {
            self.view.removeGestureRecognizer(gesture)
        }
        
        view.removeAllGestures()
    }
    

    
//  MARK: FigureObjectDelegate
    func didSelectFigureObject(object: FigureObject) {
        addGestureRecognizersToView(object)
    }
    
    func didDeselectFigureObject(object: FigureObject) {
        removeGestureRecognizersFromView(object)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

