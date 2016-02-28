//
//  NKThemeExtension.swift
//  NKThemeComponents
//
//  Created by Yang Xinyu on 2/26/16.
//  Copyright © 2016 Nickyo. All rights reserved.
//

import UIKit

/** 日夜间模式切换通知 */
let NKThemeModeChangeNotification = "NKThemeModeChangeNotification"

// MARK: UIView(themeMode) 日夜间模式
extension UIView {
    /** 切换模式额外事件 */
    func themeChanged(notification: NSNotification?) {}
    
    /** 添加通知 */
    func addNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selfThemeChanged:", name: NKThemeModeChangeNotification, object: nil)
    }
    
    /** 移除通知 */
    func removeNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selfThemeChanged:", name: NKThemeModeChangeNotification, object: nil)
    }
}

// MARK: - UIColor(themeKey) themeKey颜色
extension UIColor {
    /** 通过themeKey初始化 */
    convenience init(themeKey: String) {
        let (red, green, blue, alpha) = NKThemeManager.shareManager.getThemeColor(themeKey)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: NKThemeProtocol 日夜间模式协议
protocol NKThemeProtocol {
    /** 切换模式事件 */
    func selfThemeChanged(notification: NSNotification?)
}
