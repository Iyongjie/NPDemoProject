//
//  MyThemes.swift
//  PlistDemo
//
//  Created by Gesen on 16/3/14.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import Foundation
import SwiftTheme

enum MyThemes: Int {
    
    case normal = 1
    case night = 2
    
    // MARK: -
    
    static var current = MyThemes.normal
    static var before  = MyThemes.normal
    
    // MARK: - Switch Theme
    
    static func switchTo(_ theme: MyThemes) {
        before  = current
        current = theme
        
        switch theme {
        case .normal  : ThemeManager.setTheme(jsonName: "normal_theme", path: .mainBundle)
        case .night : ThemeManager.setTheme(jsonName: "night_theme", path: .mainBundle)
        }
    }
    
    // MARK: - Switch Night
    
    static func switchNight(_ isToNight: Bool) {
        switchTo(isToNight ? .night : before)
    }
    
    static func isNight() -> Bool {
        return current == .night
    }
    
}
