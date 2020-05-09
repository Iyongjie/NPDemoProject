//
//  UIImageView+Additional.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/30.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
     // 为了防止Kingfish不更新，在这里更换库
    
    /// 加载网络图片
    /// - Parameter url: 图片地址
    func setImage(from url: String?) {
        let imageUrl = URL(string: url!)
        kf.setImage(with: imageUrl)
    }
}
