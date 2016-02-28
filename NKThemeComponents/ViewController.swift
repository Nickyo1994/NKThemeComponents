//
//  ViewController.swift
//  NKThemeComponents
//
//  Created by Yang Xinyu on 2/23/16.
//  Copyright © 2016 Nickyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newView: NKView = NKView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.addTarget(self, action: "changMode", forControlEvents: .TouchUpInside)
        button.setTitle("切换模式", forState: .Normal)
        button.frame = CGRectMake(100, 400, 120, 50)
        button.backgroundColor = .redColor()
        self.view.addSubview(button)
        
        newView.frame = CGRectMake(100, 100, 200, 200)
        newView.backgroundColorKey = "k1"
        self.view.addSubview(newView)
        
        //        let newView1 = NKView()
        //        newView1.frame = CGRectMake(110, 110, 180, 180)
        //        newView1.backgroundColorKey = "k2"
        //        self.view.addSubview(newView1)
        
        let button1 = UIButton()
        button1.addTarget(self, action: "changColor", forControlEvents: .TouchUpInside)
        button1.setTitle("切换颜色", forState: .Normal)
        button1.frame = CGRectMake(100, 550, 120, 50)
        button1.backgroundColor = .redColor()
        self.view.addSubview(button1)
    }
    
    func changMode() {
        NKThemeManager.shareManager.changeCurrentMode()
    }
    
    func changColor() {
        if self.newView.backgroundColorKey == "k1" {
            self.newView.backgroundColorKey = "k2"
        } else {
            self.newView.backgroundColorKey = "k1"
        }
    }
}

