//
//  NPPayPopupView.swift
//  NPMine
//
//  Created by 李永杰 on 2020/5/6.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import FWPopupView

class NPPayPopupView: FWPopupView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}
