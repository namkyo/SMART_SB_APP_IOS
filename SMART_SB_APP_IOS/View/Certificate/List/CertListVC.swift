//
//  CertListVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/31.
//

import UIKit
class CertListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let certList = AppDelegate().certManager
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
    
    func setupView() {
        if certList.count() == 0 {
            UIApplication.shared.showAlert(message: "등록된 공동인증서가 없습니다.", confirmHandler: {
                self.dismiss(animated: true, completion: nil)
            })
        }
    }

    
}