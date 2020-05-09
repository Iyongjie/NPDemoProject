//
//  NPHomeCourseLayout.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

public class NPHomeCourseLayout: NSObject {
    
    var title: String?
    
    static func initWithModels(models: [NPHomeCarModel]) -> [NPHomeCourseLayout]{
        
        var layouts = [NPHomeCourseLayout]()
        for model in models {
            let layout = NPHomeCourseLayout()
            layout.title = model.categoryName
            layouts.append(layout)
        }
        return layouts
    }
     
}
