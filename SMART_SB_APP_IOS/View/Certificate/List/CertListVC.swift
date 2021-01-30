//
//  CertListVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/31.
//

import UIKit
class CertListVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        Log.print("CertListVC loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print("CertListVC viewDidLoad")
        
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("CertListVC viewDidAppear")
    }
    
    
}
