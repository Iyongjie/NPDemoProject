//
//  NPAlert.swift
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/13.
//  Copyright © 2020 NewPath. All rights reserved.
//

import Foundation

public class NPAlert {
    
    class func showSystemAlert(on controller: UIViewController,
                               title: String?,
                               message: String?,
                               sureTitle: String?,
                               onClose: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: sureTitle, style: .cancel) { (_) in
            if let action = onClose {
                action()
            }
        })
        controller.present(alert, animated: true, completion: nil)
    }
}
