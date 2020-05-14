//
//  NPUserDefaultWrapper.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/5/13.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation

//@propertyWrapper
//struct UserDefaultWrapper<T> {
//    private let key: String
//    private let defaultValue: T
//    init(key: String, defaultValue: T) {
//        self.key = key
//        self.defaultValue = defaultValue
//    }
//  
//    var wrappedValue: T {
//        get {
//            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: key)
//        }
//    }
//}
//
//extension UserDefaults {
//      @UserDefaultWrapper(key: Keys.isFirstLaunch, defaultValue: false)
//    var isFirstLaunch: Bool
//    var isLogin: Bool
//}
