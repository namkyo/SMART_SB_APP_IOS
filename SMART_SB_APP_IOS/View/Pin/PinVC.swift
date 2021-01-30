//
//  PinVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/31.
//

import UIKit
class PinVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("PinVC loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PinVC viewDidLoad")
        
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("PinVC viewDidAppear")
    }
    
    
}
