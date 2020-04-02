//
//  NPMineViewController.swift
//  NPMine
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit

public class NPMineViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configUI()  {
        self.view.backgroundColor = RGBAlpa(r: 0.2, g: 0, b: 0.8)
    }

}
