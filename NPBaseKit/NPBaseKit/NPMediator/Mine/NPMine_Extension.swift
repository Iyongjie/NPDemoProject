//
//  NPMine_Extension.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/5.
//  Copyright © 2020 NewPath. All rights reserved.
//
 
import CTMediator

public extension CTMediator {
    @objc public func A_showSwift(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"NPMine_swift"
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget("NPMine", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
}
