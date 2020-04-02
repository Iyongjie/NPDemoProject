//
//  String+Additional.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation
import UIKit
public extension String {
    
  
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithFont(font : UIFont, fixedWidth : CGFloat) -> CGFloat {
        
        guard count > 0 && fixedWidth > 0 else {
            return 0
        }
       
        let rect = NSString(string: self).boundingRect(with: CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.size.height
    }
}
