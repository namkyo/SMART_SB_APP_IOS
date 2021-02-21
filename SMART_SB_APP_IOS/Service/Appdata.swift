//
//  Appdata.swift
//  SmartSavingsBank
//
//  Created by 김남교 on 2020/12/20.
//

import Foundation
class Appdata{
    func appData(params:Dictionary<String, Any>){
        print("britge")
        
        let gubun = params["gubun"] as! String
        
        switch gubun {
        case Constants.AppData.C:
            Log.print(message: "등록")
            if let reqData = params["reqData"] as! Dictionary<String, Any> {
                for (key , value) in reqData {
                    UserDefaults.standard.set(key, forKey: value)
                }
            }
        case Constants.AppData.R:
            Log.print(message: "조회")
            
        default:
            Log.print(message: "미사용")
        }
    }
}
