//
//  Britg.swift
//  SmartSavingsBank
//
//  Created by 김남교 on 2020/12/19.
//

import WebKit
class NativeBridge{
    func bridge(didReceive message: WKScriptMessage){
        print("bridge")
        
        guard let jsonString = message.body as? String else {
            Log.print(message: "json String Error")
            return
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            Log.print(message: "jsonData error")
            return
        }
        
        let dicData = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
        
        if let reVal = dicData as? [String: Any] {
            guard let serviceCd = reVal["serviceCd"] as? String else {
                Log.print(message: "serviceCd nil")
                return
            }
            
            
            switch serviceCd {
                case Constants.ServiceCode.AUTHORIZATION:
                    Log.print(message: "AUTHORIZATION ")
                    break
                case Constants.ServiceCode.TRANSKEY:
                    Log.print(message: "TRANSKEY ")
                    break
                case Constants.ServiceCode.OCR:
                    Log.print(message: "OCR ")
                    break
                case Constants.ServiceCode.SIGN_CERT_MANAGE:
                    Log.print(message: "SIGN_CERT_MANAGE ")
                    break
                case Constants.ServiceCode.SIGN_CERT:
                    Log.print(message: "SIGN_CERT ")
                    break
                case Constants.ServiceCode.CALENDAR:
                    Log.print(message: "CALENDAR ")
                    break
                case Constants.ServiceCode.SCRAPING:
                    Log.print(message: "SCRAPING ")
                    break
                case Constants.ServiceCode.APP_DATA:
                    Log.print(message: "APP_DATA ")
                    break
                case Constants.ServiceCode.APP_LINK:
                    Log.print(message: "APP_LINK ")
                    break
                case Constants.ServiceCode.WEB_LINK:
                    Log.print(message: "WEB_LINK ")
                    break
                case Constants.ServiceCode.GET_ADID:
                    Log.print(message: "GET_ADID ")
                    break
                case Constants.ServiceCode.LOADING:
                    Log.print(message: "LOADING ")
                    break
                case Constants.ServiceCode.APP_CLOSE:
                    Log.print(message: "APP_CLOSE ")
                    exit(0)
                    break
                default:
                    Log.print(message: "default ")
                    break
            }
            
        }
        
    }
}
