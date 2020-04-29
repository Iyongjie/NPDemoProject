//
//  UIView+Additional.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/29.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import Foundation

public enum UIViewDashLineDirection {
    case horizontal
    case vertical
}

public extension UIView {
    
    /// 自定义圆角
    /// - Parameters:
    ///   - rect: 圆角位置 eg: [.topLeft, .topRight]
    ///   - radius: 圆角半径
    func makeCorner(_ rect: UIRectCorner, _ radius: CGFloat) {
        
        self.layoutIfNeeded()//这句代码很重要，不能忘了
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rect, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
    }
}

