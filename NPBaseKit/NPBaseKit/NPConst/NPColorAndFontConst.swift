//
//  NPColorAndFontConst.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/11.
//  Copyright © 2020 NewPath. All rights reserved.
//


import Foundation
import UIKit

public let kAppMainColor = HexColorAlpha(rgbValue: 0x2878FF)

public let kFontRegular = "PingFangSC-Regular"
public let kFontSemiBold = "PingFangSC-Semibold"

// MARK: 十六进制与alpha来设置颜色值（ 样式： 0xff00ff ）
public func HexColorAlpha(rgbValue : Int, alpha : Float = 1) -> UIColor {
    return UIColor(red: CGFloat(CGFloat((rgbValue & 0xFF0000) >> 16)/255), green: CGFloat(CGFloat((rgbValue & 0xFF00) >> 8)/255), blue: CGFloat(CGFloat(rgbValue & 0xFF)/255), alpha: CGFloat(alpha))
}

// MARK: 通过 red 、 green 、blue 、alpha 颜色数值
public func RGBAlpa(r: Float, g: Float, b: Float, a: Float = 1) -> UIColor {
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
}


// MARK: 字体 字号
func kFontSize(_ a: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: a)
}
func kFontBoldSize(_ a: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: a)
}
