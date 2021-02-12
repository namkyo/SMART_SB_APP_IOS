//
//  CertImportVC.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/02/12.
//
import UIKit
class CertImportVC: UIViewController {
    
    var icrp : ICRProtocol!
    
    @IBOutlet weak var randomNum: UILabel!
    
    
    
    override func loadView() {
        super.loadView()
        Log.print("CertImportVC loadView")
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print("CertImportVC viewDidLoad")
        import1()
        
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Log.print("CertImportVC viewDidAppear")
    }
    

    func import1 (){
        self.icrp=ICRProtocol.init(ip: Configuration.KSW_IP, port: UInt(Configuration.KSW_PORT))
        let ret = icrp.import1()
        
        if ret < 0 {
            UIApplication.shared.showAlert(message: icrp.lastErrorMessage, confirmHandler:{
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            let fullAuthCode = icrp.generatedNumber
            let range1 = NSMakeRange(0, 4)
            let range2 = NSMakeRange(4, 4)
            let range3 = NSMakeRange(8, 4)
            
            let num1: String = (NSString(string: fullAuthCode!)).substring(with: range1)
            let num2: String = (NSString(string: fullAuthCode!)).substring(with: range2)
            let num3: String = (NSString(string: fullAuthCode!)).substring(with: range3)
            
            randomNum.text = num1 + " - " + num2 + " - " + num3
        }
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        Log.print("CertImportVC closeBtn")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func importRun(_ sender: Any) {
        
        
        var bRet:Bool
        
        let ret = icrp.import2()
        if ret == 1 {
            Log.print("인증서를 성공적으로 받아왔습니다.")
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            
            let manager = appDelegate.certManager
            let importCert = icrp.certData
            let importKey=icrp.keyData
            
            bRet=manager.saveCert(toKeyChain: importCert ,key: importKey)
            
            if(!bRet){
                UIApplication.shared.showAlert(message: "인증서 저장 실패 1", confirmHandler:{
                    self.dismiss(animated: true, completion: nil)
                })
                return
            }
            
            if let cert=Certificate.init(cert: importCert){
                UIApplication.shared.showAlert(message: "인증서 저장완료\n인정서 DN : "+cert.getSubject()+"\n정책 : "+cert.getPolicy(), confirmHandler:{
                    self.dismiss(animated: true, completion: nil)
                })
            }else{
                UIApplication.shared.showAlert(message: "인증서 저장 실패 2", confirmHandler:{
                    self.dismiss(animated: true, completion: nil)
                })
                return
            }
            
            
            
        }else{
            UIApplication.shared.showAlert(message: "통신오류 : "+String(ret), confirmHandler:{
                self.dismiss(animated: true, completion: nil)
            })
        }
        
        
    }
    
}
