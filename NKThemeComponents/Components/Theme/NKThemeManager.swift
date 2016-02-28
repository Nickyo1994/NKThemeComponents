//
//  NKThemeManager.swift
//  NKThemeComponents
//
//  Created by Yang Xinyu on 2/26/16.
//  Copyright © 2016 Nickyo. All rights reserved.
//

import UIKit

let NK_THEME_CURRENT_MODE = "nkThemeCurrentMode"

// MARK: NKThemeMode
/** 日夜间模式 */
enum NKThemeMode: Int {
    /** 日间模式 */
    case Normal
    /** 夜间模式 */
    case Night
    
    /** 日夜间模式切换 */
    mutating func changeMode() {
        switch self {
        case .Normal:
            self = .Night
        case .Night:
            self = .Normal
        }
        NSUserDefaults.standardUserDefaults().setObject(self.rawValue, forKey: NK_THEME_CURRENT_MODE)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

// MARK: - NKThemeManager 日夜间模式管理
/** 日夜间模式管理 */
class NKThemeManager {
    /** 日夜间模式管理单例 */
    static let shareManager = NKThemeManager()
    /** 当前模式 */
    private(set) var currentMode: NKThemeMode
    
    /** 私有初始化 */
    private init() {
        // 尝试从本地读取保存的模式，读取失败设为日间模式
        if let currentModeValue = NSUserDefaults.standardUserDefaults().objectForKey(NK_THEME_CURRENT_MODE) as? Int, mode = NKThemeMode(rawValue: currentModeValue) {
            currentMode = mode
        } else {
            currentMode = .Normal
        }
    }
    
    /** 切换当前模式 */
    func changeCurrentMode() {
        currentMode.changeMode()
        NSNotificationCenter.defaultCenter().postNotificationName(NKThemeModeChangeNotification, object: nil)
    }
}

// MARK: ThemeColor 模式颜色
extension NKThemeManager {
    /** 通过themeKey获取rgba值 */
    func getThemeColor(themeKey: String) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        // 临时测试用
        if themeKey == "k1" {
            if self.currentMode == .Normal {
                return (1, 1, 0, 1)
            } else {
                return (0, 0, 1, 1)
            }
        } else if themeKey == "k2" {
            if self.currentMode == .Normal {
                return (0, 1, 0, 1)
            } else {
                return (1, 0, 0, 1)
            }
        }
        return (1, 1, 1, 1)
    }
}
