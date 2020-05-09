//
//  NPGoodInfoPopupView.swift
//  NPMine
//
//  Created by 李永杰 on 2020/5/6.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import FWPopupView

class NPGoodInfoPopupView: FWPopupView {
    
    lazy var segmentView: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["111", "222", "444"])
        return seg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.green
        self.addSubview(segmentView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCorner([.topLeft, .topRight], 10)
        
        segmentView.frame = CGRect(x: 30, y: 20, width: 100, height: 30)
    }

}
