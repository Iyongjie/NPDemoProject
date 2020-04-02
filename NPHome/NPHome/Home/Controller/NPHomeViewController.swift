//
//  NPHomeViewController.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

public class NPHomeViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        print("视图加载完成")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("将要出现")
    }
    
    func configUI() {
        print("UI初始化完成")
    }
}
