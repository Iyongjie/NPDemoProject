//
//  NPNavigationMap.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/4/16.
//  Copyright © 2020 NewPath. All rights reserved.
//
 
import UIKit
import URLNavigator
import NPMine

enum NavigationMap {
    static func initialize(navigator: NavigatorType) {
        navigator.register("navigator://mine/<name>") { url, values, context in
            guard let username = values["name"] as? String else { return nil }
            print(username)
            return NPMineViewController(navigator: navigator)
        }
        navigator.handle("navigator://alert", self.alert(navigator: navigator))
        navigator.handle("navigator://<path:_>") { (url, values, context) -> Bool in
            // No navigator match, do analytics or fallback function here
            print("[Navigator] NavigationMap.\(#function):\(#line) - global fallback function is called")
            return true
        }
    }
     
    private static func alert(navigator: NavigatorType) -> URLOpenHandlerFactory {
        return { url, values, context in
            guard let title = url.queryParameters["title"] else { return false }
            let message = url.queryParameters["message"]
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            navigator.present(alertController)
            return true
        }
    }
}
