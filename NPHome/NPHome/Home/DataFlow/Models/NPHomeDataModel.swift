//
//  NPHomeDataModel.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation
import HandyJSON

struct NPHomeCarModel: HandyJSON {
     
    var isDisplay: Int = 0
    var sort: Int = 0
    var uid: Int = 0
    var id: String?
    var categoryId: Int = 0
    var isEditor: Int = 0
    var createdAt: String?
    var categoryName: String?
}
 
