//
//  NKView.swift
//  NKThemeComponents
//
//  Created by Yang Xinyu on 2/26/16.
//  Copyright © 2016 Nickyo. All rights reserved.
//

import UIKit

class NKView: UIView, NKThemeProtocol {
    var backgroundColorKey: String? = nil {
        didSet {
            if let backgroundColorThemeKey = self.backgroundColorKey where oldValue != backgroundColorThemeKey {
                self.backgroundColor = UIColor(themeKey: backgroundColorThemeKey)
            }
        }
    }
    
    var borderColorKey: String? = nil {
        didSet {
            if let borderColorThemeKey = self.borderColorKey where oldValue != borderColorThemeKey {
                self.layer.borderColor = UIColor(themeKey: borderColorThemeKey).CGColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addNotification()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        self.removeNotification()
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        self.selfThemeChanged(nil)
    }
    
    func selfThemeChanged(notification: NSNotification?) {
        if let backgroundColorThemeKey = self.backgroundColorKey {
            self.backgroundColor = UIColor(themeKey: backgroundColorThemeKey)
        }
        if let borderColorThemeKey = self.borderColorKey {
            self.layer.borderColor = UIColor(themeKey: borderColorThemeKey).CGColor
        }
        self.themeChanged(notification)
    }
}
