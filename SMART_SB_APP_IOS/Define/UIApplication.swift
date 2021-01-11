//
//  UIApplication.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/11.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController() -> UIViewController? {
        if let keyWindow = UIApplication.shared.keyWindow {
            if var viewController = keyWindow.rootViewController {
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                print("topViewController -> \(String(describing: viewController))")
                return viewController
            }
        }
        return nil
    }
    func showAlert(title: String = "알림",
                   message: String?,
                   hideCancel:Bool = true,
                   cancelTitle: String = "취소",
                   confirmTitle: String = "확인",
                   cancelHandler: (() -> Void)? = nil,
                   confirmHandler: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: { action in
            //Log.print(message: "cancel")
            cancelHandler?()
        })
        let ok = UIAlertAction(title: confirmTitle, style: .default, handler: { action in
            //Log.print(message: "confirm")
            confirmHandler?()
        })
        if hideCancel == true {
            alert.addAction(ok)
        } else {
            alert.addAction(cancel)
            alert.addAction(ok)
        }
        
        let topView = UIApplication.topViewController()
        topView?.present(alert, animated: true, completion: nil)
//        keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
