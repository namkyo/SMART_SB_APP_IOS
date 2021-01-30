//
//  LaunchScreen.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print("SplashVC viewDidLoad")
        self.navigationController?.navigationBar.isHidden = true
        if(Configuration.OPER_DEV_YN){
            UserDefaults.standard.set(Configuration.OPER_URL, forKey: Configuration.URL)
        }else{
            UserDefaults.standard.set(Configuration.DEV_URL, forKey: Configuration.URL)
        }
        //setView()
        //Function.showAlert(vc: self, title: "알림", message: "테스트", actionTitle: "확인")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("SplashVC viewDidAppear")
        //대기시간
        sleep(4)
        SceneCoordinator().transition(to: "Test", using: .root, animated: false)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("SplashVC viewWillDisappear")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("SplashVC viewDidDisappear")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
        super.viewDidAppear(true)
        Log.print("SplashVC didReceiveMemoryWarning")
    }
}

