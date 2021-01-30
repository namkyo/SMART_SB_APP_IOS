//
//  ViewController.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit
import WebKit

class MainVC: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    
    var modalYn=false
    
    //컨트롤러 생성자
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print("MainVC viewDidLoad")
        
        self.navigationController?.navigationBar.isHidden = true
        
        webViewUI()
        setupView()
    }
    
    
    //뷰 생성
    override func loadView() {
        super.loadView()
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        let userScript = WKUserScript(source: Configuration.JS_TO_SWIFT, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        for jsMethod in Configuration.JS_TO_SWIFT_METHOD{
            contentController.add(self, name: jsMethod)
        }
        config.userContentController = contentController
        config.preferences = preferences
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
    }
    
    
    func setupView() {
        print("MainVC viewDidLoad : ")
        //1. 웹뷰 화면 생성≈
        if let strUrl = UserDefaults.standard.string(forKey: Configuration.URL){
            print("strUrl : "+strUrl)
           // let url = URL(string: strUrl)
           // let request = URLRequest(url: url!)
            //웹뷰 url셋팅
           // self.webView.load(request)
        }
        
        let url = URL(string: Configuration.DEV_URL)
        let request = URLRequest(url: url!)
        //웹뷰 url셋팅
        self.webView.load(request)
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("MainVC viewDidAppear : ")
        print("MainVC modalYn : " , modalYn)
        /*
        if modalYn==false{
            print("화면전환");
            let testStoryBoard=UIStoryboard(name: "Test", bundle: nil)
            let uvc = testStoryBoard.instantiateViewController(withIdentifier: "TestVC")
            
            uvc.modalTransitionStyle=UIModalTransitionStyle.coverVertical
            self.present(uvc, animated: true)
            print("화면전환 끝");
            modalYn=true
            print("MainVC modalYn : " , modalYn)
        }*/
        SceneCoordinator().transition(to: "Test", using: .root, animated: false)
    }
    
    
    func webViewUI() {
        if #available(iOS 11.0, *)
        {
            let safeArea = self.view.safeAreaLayoutGuide
            webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
            webView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        }
        else
        {
            webView.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height-20)
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            webView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("MainVC viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("MainVC viewDidDisappear")
    }
    //웹뷰에서 요청
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let dictionary: [String: Any] = message.body as? Dictionary {
            NativeBridge().bridge(message:dictionary)
        }
    }
}


