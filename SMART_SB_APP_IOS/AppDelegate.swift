//
//  AppDelegate.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let bgTaskView = UIView()
    var certManager = CertManager()
    /**
     앱 초기설정
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 응용 프로그램 시작 후 사용자 지정 지점을 재정의합니다.
        Log.print("AppDelegate application")
        
        UIApplication.shared.applicationIconBadgeNumber = 0 //알림배지 초기화
        
        certManager = CertManager.init()
        /**************************** FDS service start *****************************/
        ixcSecureManager.initLicense(Configuration.IXC_LICENSE, andCustomID: Configuration.IXC_CUSTOMER_ID)
        /**************************** FDS service end *****************************/
        return true
    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

