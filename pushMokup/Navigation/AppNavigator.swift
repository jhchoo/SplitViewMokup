//
//  AppNavigator.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit
import OverlayContainer

class AppNavigator: NSObject {
    
    // MARK: 변수
    static let shared = AppNavigator()
    
    var window: UIWindow?
    
    var splitAllVC: SplitViewController!
    
    open var rootViewController: UINavigationController?
    open var currentViewController: UIViewController? {
        guard let rootViewController = rootViewController else {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        
        return rootViewController.visibleViewController ?? rootViewController.topViewController
    }
    
    func root(to baseVC: UIViewController, with window: UIWindow?) {
        self.window = window
        
        if let window = window {
            window.rootViewController = baseVC
            window.makeKeyAndVisible()
        }
    }
    
    func main() {
        guard let window = self.window else {
            return
        }

        let containerController = OverlayContainerViewController()
        containerController.delegate = self
        
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = stroyboard.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
        let mainListVC = stroyboard.instantiateViewController(withIdentifier: "mainListVC") as! MainListViewController
        containerController.viewControllers = [
            mainVC,
            mainListVC
        ]
        
        let secondVC = stroyboard.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController

        let splitVC:SplitViewController = SplitViewController()
        self.splitAllVC = splitVC
        
        let nvSecondVC = UINavigationController(rootViewController: secondVC)
        nvSecondVC.isNavigationBarHidden = true
        splitVC.viewControllers = [
            UINavigationController(rootViewController: containerController),
            nvSecondVC,
        ]
        mainVC.splitView = splitVC
        secondVC.splitView = splitVC

        window.rootViewController = splitVC
        window.makeKeyAndVisible()
    }
    
    func Login() {
        guard let window = self.window else {
            return
        }
        
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "loginVC") as! LoginController
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    
    func Detail(index: Int) {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        vc.index = index
        vc.splitView = splitAllVC
//        (self.splitAllVC.viewControllers.last as? UINavigationController)?.pushViewController(vc, animated: true)
//        let nav = UINavigationController(rootViewController: vc)
        let nv:UINavigationController = UINavigationController(rootViewController: vc)
        nv.isNavigationBarHidden = true
        self.splitAllVC.showDetailViewController(nv, sender: self)
        
        
//            let desc:DetailViewController = splitView?.detail as! DetailViewController
//            let nv:UINavigationController = UINavigationController(rootViewController: desc)
//            self.showDetailViewController(nv, sender: self)
    }
    
    func setting() {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "settingVC") as! SettingViewController
        // vc.modalPresentationStyle = .fullScreen
        // vc.modalPresentationStyle = .pageSheet 기본
        self.splitAllVC.present(vc, animated: true)
        
        
    }
}

extension AppNavigator: OverlayContainerViewControllerDelegate{

    enum OverlayNotch: Int, CaseIterable {
        case minimum, maximum
    }
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return OverlayNotch.allCases.count
    }

    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        heightForNotchAt index: Int,
                                        availableSpace: CGFloat) -> CGFloat {
        if Singletone.data.deviceIdiom == .phone {
            switch OverlayNotch.allCases[index] {
                case .maximum:
                    return availableSpace - (containerViewController.view.safeAreaInsets.top + 115)
                case .minimum:
                    return availableSpace - (containerViewController.view.safeAreaInsets.top + 235)
            }
        } else {
            return availableSpace - (containerViewController.view.safeAreaInsets.top + 235)
        }
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        scrollViewDrivingOverlay overlayViewController: UIViewController) -> UIScrollView? {
        if Singletone.data.deviceIdiom == .phone {
            return (overlayViewController as? MainListViewController)?.tableView
        } else {
            return nil
        }
    }
}
