//
//  NPDevice.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/27.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation
import CoreTelephony

public func isSIMInstalled() -> Bool {
    let info = CTTelephonyNetworkInfo()
    let carrier = info.subscriberCellularProvider
    if ((carrier?.isoCountryCode) != nil) {
        return true
    } else {
        return false
    }
}
