//
//  NPHomeCourseLayout.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

public class NPHomeCourseLayout: NSObject {
    var itemImage: UIImage? // 图片
    var plateNumber: String? // 车牌号
    var alarmTypeName: String? // 报警类型
    var alarmTime: String? // 报警时间
    var alarmStatusName: String? // 报警状态
    var alarmColor: UIColor? // 状态颜色
    var alarmId: Int? // 请求详情用
    
    static func initWithModel(messageModel: Any) -> [NPHomeCourseLayout]{
        var layouts = [NPHomeCourseLayout]()
         
        return layouts
    }
    
    public func run() {
        print("跑步")
    }
}
