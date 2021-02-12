//
//  BioVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/02/12.
//
import UIKit
class BioVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("BioVC loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BioVC viewDidLoad")
    }
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("BioVC viewDidAppear")
    }
    
    
}
