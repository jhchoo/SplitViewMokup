//
//  AppDelegate.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 화이트 테마 유지
        if #available(iOS 13.0, *){
            window?.overrideUserInterfaceStyle = .light
        }
        
        // 스토리보드를 사용하지 않고 네비게이션 컨트롤러를 적용한다.
        
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "loginVC") as! LoginController
        AppNavigator.shared.root(to: vc, with: self.window)
                
        return true
    }

}

