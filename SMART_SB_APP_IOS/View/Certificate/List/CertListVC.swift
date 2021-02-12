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
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print("CertListVC viewDidLoad")
        //setupView()
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("CertListVC viewDidAppear")
    }
    
    func setupView() {
        Log.print("CertListVC setupView")
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let certManager = appDelegate.certManager
       // let certManager = CertManager.init()
        Log.print("certList.count()  : "+String(certManager.count()))
        if certManager.count() == 0 {
            UIApplication.shared.showAlert(message: "공동인증서 복사를 먼저 수행해 주세요.", confirmHandler: {
                self.dismiss(animated: true, completion: nil)
            })
            return
        }
    }

    
}
