//
//  Function.swift
//  SmartSavingsBank
//
//  Created by 김남교 on 2020/12/19.
//

import Foundation
import UIKit
import AdSupport
class Function: NSObject {
    class func DFT_TRACE_PRINT(filename: String = #file, line: Int = #line, funcname: String = #function, output:Any...) {
        #if true
        let now = NSDate()
        print("[\(now.description)][\(filename)][\(funcname)][Line \(line)] \(output)")
        #endif
    }
    class func showAlert(vc: UIViewController, title: String, message: String, actionTitle: String) {
        // Create a UIAlertController.
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create an action of OK.
        let action = UIAlertAction(title: actionTitle, style: .default) {
            action in
            //print("Action OK!!")
        }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
