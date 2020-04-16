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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    open func addContentView() {
        contentView = UIView(frame: CGRect(x: 0, y: 88, width: self.view.frame.width, height: self.view.frame.height - 88))
        contentView.backgroundColor = .yellow
        self.view.addSubview(contentView)
    }

}
