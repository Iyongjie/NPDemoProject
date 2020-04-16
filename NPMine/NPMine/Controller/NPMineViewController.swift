//
//  NPMineViewController.swift
//  NPMine
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit
import URLNavigator

public class NPMineViewController: NPBaseViewController {
    
    let navigator: NavigatorType
 
    public init(navigator: NavigatorType) {
      self.navigator = navigator
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configUI()  {
        self.view.backgroundColor = .yellow
    }

}
