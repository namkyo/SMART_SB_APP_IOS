//
//  SceneCoordinator.swift
//  SMART_SB_APP_IOS
//
//  Created by 김남교 on 2021/01/30.
//

import Foundation
class SceneCoordinator {
    
    let sceneDelgate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    
    func transition(to scene: String, using style: TransitionStyle, animated: Bool) {
        Log.print("SceneCoordinator : "+scene)
        let storyBoard = UIStoryboard(name: scene, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: scene + "VC")
        let topView = UIApplication.topViewController()
        let window = sceneDelgate.window
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
enum TransitionStyle {
    case root
    case push
    case modal
}
