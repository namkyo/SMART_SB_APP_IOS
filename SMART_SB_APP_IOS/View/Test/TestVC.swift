//
//  TestVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit

class TestVC: UIViewController {
    override func loadView() {
        print("loadView")
        
    }
    override func viewDidLoad() {
        print("viewDidLoad")
        makeBtn()
        makeBtnLayout(btnArr: btnArr)
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Button event.
    @objc internal func onClickMyButton(_ sender: Any) {
        if let button = sender as? UIButton { print("onClickButton");
            print("button.currentTitle: \(button.currentTitle!)")
            print("button.tag: \(button.tag)")
        }
    }

    
    var btnArr: [UIButton] = []
        
    func makeBtn() {
        for index: Int in 0..<9 {
            let btn = UIButton()
            btn.tag = index
            self.view.addSubview(btn)
            btn.backgroundColor =  #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            btn.layer.borderColor = UIColor.black.cgColor // borderColor = CGcolor
            btn.layer.borderWidth = 1
            btnArr.append(btn)
        }
    }
    func makeBtnLayout(btnArr: [UIButton]) {
        for btn in btnArr {
            let index = btn.tag
            let row = index / 3 // 0, 0, 0, 1, 1, 1, 2, 2, 2
            let column = index % 3 // 0, 1, 2, 0, 1, 2, 0, 1, 2
            
            let width = self.view.frame.size.width/3
            let height = self.view.frame.size.height/3
            btn.frame = CGRect(x: CGFloat(column)*width, y: CGFloat(row)*height, width: width, height: height)
            btn.addTarget(self, action: #selector(TestVC.switchColor), for: .touchUpInside)
        }
    }
    
    var tileCase = OnOff.on
        enum OnOff {
            case on
            case off
        }
        
        func changeColorA(_ sender: UIButton) {
            let tag = sender.tag
            if isEvenNumber(num: tag) {
                sender.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }else {
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.8193424344, blue: 0, alpha: 1)
            }
        }
        
        func changeColorB(_ sender: UIButton) {
            let tag = sender.tag
            if isEvenNumber(num: tag) {
                sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }else {
                sender.backgroundColor = #colorLiteral(red: 0.9818221927, green: 0.1470750272, blue: 1, alpha: 1)
            }
        }

        @objc func switchColor(_ sender: UIButton) {
            for btn in btnArr {
                switch tileCase {
                case .on:
                    changeColorA(btn)
                    tileCase = .off
                case .off:
                    changeColorB(btn)
                    tileCase = .on
                }
            }
        }
        
        func isEvenNumber(num: Int) -> Bool {
            if num%2 == 0 {
                return true
            }else {
                return false
            }
        }
}
