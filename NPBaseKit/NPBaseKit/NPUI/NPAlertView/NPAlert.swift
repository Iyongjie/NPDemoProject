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
//let customPopupView = FWCustomPopupView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
//
//let vProperty = FWPopupViewProperty()
//vProperty.popupCustomAlignment = .bottomCenter
//vProperty.popupAnimationType = .position
//vProperty.maskViewColor = UIColor(white: 0, alpha: 0.5)
//vProperty.touchWildToHide = "1"
//vProperty.popupViewEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//vProperty.animationDuration = 0.2
//vProperty.usingSpringWithDamping = 0.7
//customPopupView.vProperty = vProperty
//
//customPopupView.show()
