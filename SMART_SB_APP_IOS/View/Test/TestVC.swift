//
//  TestVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit

class TestVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("TestVC loadView")
        makeBtn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TestVC viewDidLoad")
        
        
        let logMaster = ixcSecuLogMaster()
        logMaster.setServerKey("123123")
        logMaster.setCheckApp("")
        
    }
    
    
    func makeBtn(){
        for index in 1...5 {
            print("TestVC UIButton index "+String(index))
            let btn = UIButton()
            btn.setTitle("test"+String(index), for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.frame=CGRect.init(x: 0,y: 50*index,width: 300,height: 50)
            btn.backgroundColor = .black
            btn.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
            self.view.addSubview(btn)
        }
    }
    @objc func onTapButton() {
        print("Button was tapped.")
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("TestVC viewDidAppear")
    }
    
    
}
