//
//  ViewController.swift
//  GestureSample
//
//  Created by NAGAMINE HIROMASA on 2015/01/19.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGestureRecognizers()
        
        var figure1 = FigureObject(frame: CGRectMake(100, 100, 100, 100))
        self.view.addSubview(figure1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addGestureRecognizers() {
        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("tappedAction"))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tappedAction(){
        
    }
    
}

