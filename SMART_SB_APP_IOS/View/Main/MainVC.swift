//
//  ViewController.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/10.
//

import UIKit
import WebKit

class MainVC: UIViewController{
    
    var webView: WKWebView!
    
    
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
        let userScript = WKUserScript(source: "postMessage()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)

        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true

        contentController.add(self, name: "callbackHandler")
        config.userContentController = contentController
        config.preferences = preferences
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
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
        
        var urlString = ""
        
        switch Constants.MODE {
        case "R":
            urlString=Constants.PageUrl.WEB_MAIN_R+Configuration.MAIN_VIEW_URL
        case "D":
            urlString=Constants.PageUrl.WEB_MAIN_D+Configuration.MAIN_VIEW_URL
        case "H":
            urlString=Constants.PageUrl.WEB_MAIN_H+Configuration.MAIN_VIEW_URL
        default:
            Log.print(message: "유효하지 않은 접속")
        }
        
        let request = URLRequest(url: URL(string: urlString)!)
        //웹뷰 url셋팅
        self.webView.load(request)
    }
    
    //뷰 생성 끝나고
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("MainVC viewDidAppear : ")
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
}

//MARK: - Bridge Callback Handler
extension MainVC: WKScriptMessageHandler {
    //웹뷰에서 요청
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "callbackHandler" {
            guard let dictionary: [String: Any] = message.body as? Dictionary else {
                Log.print(message: "json String Error")
                return
            }
            
            let sf = dictionary["SF"] as Any
            let ff = dictionary["FF"] as Any
            
            if let jsonString = dictionary["DATA"] as? String{
                let jsonData = jsonString.data(using: .utf8)!
                let dicData = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
            
                if let reVal: [String: Any] = dicData as? Dictionary {
                    guard let serviceCd = reVal["serviceCd"] as? String else {
                        Log.print(message: "serviceCd nil")
                        return
                    }
                    Log.print(message: "native serviceCd : " + serviceCd)
                    
                    guard let params = reVal["params"] as? [String: String] else {
                        Log.print(message: "params error")
                        return
                    }
                    Log.print(message: "native params : " + params.description)
                    
                    switch serviceCd {
                        case Constants.ServiceCode.AUTHORIZATION:
                            Log.print(message: "AUTHORIZATION ")
                            break
                        case Constants.ServiceCode.TRANSKEY:
                            Log.print(message: "TRANSKEY ")
                            break
                        case Constants.ServiceCode.OCR:
                            Log.print(message: "OCR ")
                            SceneCoordinator().transition(to: "Ocr", using: .modal, animated: false)
                            break
                        case Constants.ServiceCode.SIGN_CERT_MANAGE:
                            Log.print(message: "SIGN_CERT_MANAGE ")
                            break
                        case Constants.ServiceCode.SIGN_CERT:
                            Log.print(message: "SIGN_CERT ")
                            break
                        case Constants.ServiceCode.CALENDAR:
                            Log.print(message: "CALENDAR ")
                            break
                        case Constants.ServiceCode.SCRAPING:
                            Log.print(message: "SCRAPING ")
                            break
                        case Constants.ServiceCode.APP_DATA:
                            Log.print(message: "APP_DATA ")
                            Appdata().appData(params: reVal["params"] as! Dictionary<String, Any>)
                            break
                        case Constants.ServiceCode.APP_LINK:
                            Log.print(message: "APP_LINK ")
                            break
                        case Constants.ServiceCode.WEB_LINK:
                            Log.print(message: "WEB_LINK ")
                            break
                        case Constants.ServiceCode.GET_ADID:
                            Log.print(message: "GET_ADID ")
                            break
                        case Constants.ServiceCode.LOADING:
                            Log.print(message: "LOADING ")
                            break
                        case Constants.ServiceCode.APP_CLOSE:
                            Log.print(message: "APP_CLOSE ")
                            exit(0)
                            break
                        default:
                            Log.print(message: "default ")
                            break
                    }
                }
            }
        }
    }
}

//MARK :-
extension MainVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let cred = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, cred)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        if let tempStr = webView.url?.absoluteString {
            if tempStr.hasPrefix("tel") {
                let numberURL = webView.url //NSURL(string: urlString)
                //UIApplication.shared.openURL(numberURL!)
                //UIApplication.shared.canOpenURL(numberURL!)
                UIApplication.shared.open(numberURL!, options: [:], completionHandler: nil)
            }
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let strUrl = navigationAction.request.url?.absoluteString
        guard let url = URL(string: strUrl!) else { return }
        
        if ((strUrl?.hasPrefix("tauthlink"))! || (strUrl?.hasPrefix("ktauthexternalcall"))! || (strUrl?.hasPrefix("upluscorporation"))! || (strUrl?.hasPrefix("niceipin2"))!) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
            decisionHandler(.cancel)
            return
        }
        
        decisionHandler(.allow)
        return
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.evaluateJavaScript("navigator.userAgent", completionHandler: { result, error in
            if let userAgent = result as? String {
                
            }
        })
    }
}
//MARK :-
extension MainVC: WKUIDelegate {
    
    //alert 처리
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        //{serviceCd:'SIGN_CERT', params:{rbrNo:'주민번호', signData:'인증서명데이타'}}
        //message    String    "\"{“serviceCd”:”SIGN_CERT”, “params”:{“rbrNo”:”주민번호”, “signData”:”인증서명데이타”}}\""
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (action) in completionHandler()
            
        }))
        self.present(alertController, animated: true, completion: nil)
        
        let jsonString = message
        
        let jsonData = jsonString.data(using: .utf8)!
        let dicData = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
        
        
    }
    
    //confirm 처리
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (action) in completionHandler(true)
            
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: {
            (action) in completionHandler(false)
            
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    //confirm 처리2
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alertController = UIAlertController(title: "", message: prompt, preferredStyle: .alert)
        alertController.addTextField {
            (textField) in textField.text = defaultText
            
        }
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (action) in
            if let text = alertController.textFields?.first?.text {
                completionHandler(text)
                
            } else {
                completionHandler(defaultText)
                
            } }))
        
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: {
            (action) in completionHandler(nil)
            
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
            
        }
        return nil
        
    }
    
    func webViewDidClose(_ webView: WKWebView) {
    }
    
    
    // 중복적으로 리로드 방지
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
        
    }
    
    func webViewReload() {
        viewDidLoad()
    }
}
