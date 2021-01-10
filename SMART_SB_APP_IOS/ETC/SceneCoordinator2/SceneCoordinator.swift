//
//  SceneCoordinator.swift
//  JTSB
//
//  Created by 최지수 on 26/04/2020.
//  Copyright © 2020 CJS. All rights reserved.
//

import Foundation


class SceneCoordinator {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func transition(to scene: String, using style: TransitionStyle, animated: Bool) {
        let sb = UIStoryboard(name: scene, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: scene + "VC")
        let window = appDelegate.window
        let topView = UIApplication.topViewController()
        
        switch style {
        case .modal:
            topView?.present(vc, animated: animated, completion: nil)
            
        case .push:
            
            let nvc = UINavigationController(rootViewController: vc)
            topView?.navigationController?.pushViewController(nvc, animated: animated)
            
        case .root:
            let nvc = UINavigationController(rootViewController: vc)
            window?.rootViewController = nvc
            window?.makeKeyAndVisible()
        }
    }
}
