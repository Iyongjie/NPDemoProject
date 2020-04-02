//
//  NPHomeDataModel.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation
import ObjectMapper

struct NPHomeCarModel: Mappable {
     
    var deviceType: String?
    var teamName: String?
    var vehicleColor: Int?
    
    init?(map: Map) {
            
    }
    
    mutating func mapping(map: Map) {
        deviceType <- map["deviceType"]
        teamName <- map["teamName"]
        vehicleColor <- map["vehicleColor"]
    }
    
}

struct NPHomeCarChannelModel: Mappable {
   
    var rows: [NPHomeCarChannelItemModel]?
    var total: Int?
    var page: Int?
    
    init?(map: Map) {
            
    }
       
    mutating func mapping(map: Map) {
        rows <- map["rows"]
        total <- map["total"]
        page <- map["page"]
    }
}

struct NPHomeCarChannelItemModel: Mappable {
    
    var id: Int?
    var deviceId: String?
    
    init?(map: Map) {
            
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        deviceId <- map["deviceId"]
    }
}
