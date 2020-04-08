//
//  Target_NPSearch.swift
//  NPHome
//
//  Created by 李永杰 on 2020/4/3.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

@objc class Target_NPSearch: NSObject {
    
    @objc func Action_Extension_ViewController(_ params:NSDictionary) -> UIViewController {
        if let callback = params["callback"] as? (String) -> Void {
            callback("success")
        }
        
        let searchVC = NPSearchViewController()
        return searchVC
    }
}
