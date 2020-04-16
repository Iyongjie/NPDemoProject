//
//  NPTabbarController.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import CYLTabBarController
import NPHome
import NPMine
import URLNavigator

class NPTabbarController: CYLTabBarController {
 
    static func initWithContext() -> NPTabbarController {
        let tabBarVC = NPTabbarController(viewControllers: NPTabbarController.viewControllers(), tabBarItemsAttributes: NPTabbarController.tabBarItemsAttributesForController())
        return tabBarVC
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func viewControllers() -> [UINavigationController]{
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let home = NPNavigationController(rootViewController: NPHomeViewController(navigator: app.navigator!))
        let mine = NPNavigationController(rootViewController: NPMineViewController(navigator: app.navigator!))
        let viewControllers = [home, mine]
        return viewControllers
    }
    
    static func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let tabBarItemHome = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"",
                             CYLTabBarItemSelectedImage:""]
        let tabBarItemMine = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"",
                              CYLTabBarItemSelectedImage:""]
        let tabBarItemsAttributes = [tabBarItemHome, tabBarItemMine]
        return tabBarItemsAttributes
    }

}
