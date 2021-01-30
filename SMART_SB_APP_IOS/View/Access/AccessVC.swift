//
//  AccessVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/31.
//

import UIKit
class AccessVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("AccessVC loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TestVC viewDidLoad")
        
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("AccessVC viewDidAppear")
    }
    
    
}
