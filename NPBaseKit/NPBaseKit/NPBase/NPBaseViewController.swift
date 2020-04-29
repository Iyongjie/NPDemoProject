//
//  NPBaseViewController.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/10.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

open class NPBaseViewController: UIViewController {
    
    open var contentView = UIView()
    
    open var navigationBar = NPNavigationBar()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    open func addNavigationBar() {
    
    }
    
    open func removeNavigationBar() {
        self.navigationBar.removeFromSuperview()
        self.contentView.frame = self.view.frame
    }
    
    open func addContentView() {
        contentView = UIView(frame: CGRect(x: 0, y: kNavigationBarHeight, width: self.view.frame.width, height: self.view.frame.height - kNavigationBarHeight))
        contentView.backgroundColor = .yellow
        self.view.addSubview(contentView)
    }

}
