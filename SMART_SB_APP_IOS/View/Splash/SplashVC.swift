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
        print("LaunchScreen viewDidLoad : ")
        self.navigationController?.navigationBar.isHidden = true
        if(Configuration.OPER_DEV_YN){
            UserDefaults.standard.set(Configuration.OPER_URL, forKey: Configuration.URL)
        }else{
            UserDefaults.standard.set(Configuration.DEV_URL, forKey: Configuration.URL)
        }
        setView()
        Function.showAlert(vc: self, title: "알림", message: "테스트", actionTitle: "확인")
        nextView()
    }
    func nextView()  {
        print("IntroVC nextView : ")
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        //flipHorizontal 앞뒤로 전환
        //CoverVertical 아래에서 위로 전환
        //crossDissolve  사라지며전환
        //partialCurl 아래에서 말아올라가며 전환
        //오른쪽으로 이동
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        
        //viewcontroller?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //uvc.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        
        viewcontroller?.modalPresentationStyle = .fullScreen
        
        // B 컨트롤러 뷰로 넘어간다.
        //self.present(viewcontroller!, animated: true, completion: nil)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        
        window?.rootViewController = viewcontroller
        window?.makeKeyAndVisible()
    }
    
    
    func setView() {
        let imgW = 100*(self.view.frame.size.width)/320.0
        let imgH = 120*(self.view.frame.size.width)/320.0
        let spY = 60*(self.view.frame.size.width)/320.0
        let imgY = ((self.view.frame.height - imgH)/2) - spY
        let logoW = 200*(self.view.frame.size.width)/320.0
        let logoH = 30*(self.view.frame.size.width)/320.0
        
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "intro_gif_forever", withExtension: "gif")!)
        let advTimeGif = UIImage(data: imageData!)
       // let advTimeGif = UIImage.gifImageWithData(data: imageData! as NSData)
        let imageView1 = UIImageView(image: advTimeGif)
        
        imageView1.frame = CGRect(x: (self.view.frame.size.width - imgW)/2, y: imgY, width: imgW, height: imgH)
        imageView1.startAnimating()
        view.addSubview(imageView1)
        
        let imageViewY = imgY + imgH + 10
        
        let imageView2 = UIImageView(image: UIImage(named: "logo_w"))
        imageView2.frame = CGRect(x: (self.view.frame.size.width - logoW)/2, y: imageViewY, width: logoW, height: logoH)
        view.addSubview(imageView2)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //Function.DFT_TRACE_PRINT(output: "launch viewDidAppear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //Function.DFT_TRACE_PRINT(output: "launch viewWillDisappear")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        //Function.DFT_TRACE_PRINT(output: "launch viewDidDisappear")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
    }
}

