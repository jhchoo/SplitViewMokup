//
//  SplitViewController.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    /// #. root, detail viewController 들
    var root:UIViewController?
    var detail:UIViewController?
    
    var primaryHidden: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .oneBesideSecondary

        // iOS 14 와서 버그가 있다. 단독으로 사용하지 못하고
        // 스케일 사이즈와 고정 사이즈 적고, 아래쪽에 있는것이 적용된다.
        self.preferredPrimaryColumnWidthFraction = 0.4 // set the width based on screen needs.
        if UIWindow.isLandscape {
            self.maximumPrimaryColumnWidth = 375
        } else {
            self.maximumPrimaryColumnWidth = 320
        }
        
        
        // 네비게이션을 숨김처리해도 스와이프를 이용한 뒤로가기 동작을 수행할 수 있게 된다.
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.navigationController?.isNavigationBarHidden = true
        if UIDevice.current.orientation.isLandscape {
            self.maximumPrimaryColumnWidth = 375
        } else {
            self.maximumPrimaryColumnWidth = 320
        }
        
//        if self.displayMode == .primaryHidden {
//            print("Detail is visible")
//            primaryHidden = true
//        } else  {
//            print("Master and Detail are visible")
//            primaryHidden = false
//        }
    }
    
    // MARK: -
    // MARK: - SplitView Delegate
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
        print("Detail is \(displayMode.rawValue)")
        print("isCollapsed is \(self.isCollapsed)")
        
        if displayMode == .primaryHidden { 
            print("Detail is visible")
            primaryHidden = true
        } else  {
            print("Master and Detail are visible")
            primaryHidden = false
        }
    }
}


extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}

extension SplitViewController {
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
    
    func toggleMasterView() {
        
        if self.preferredDisplayMode == .oneBesideSecondary {
            UIView.animate(withDuration: 0.3) {
                self.preferredDisplayMode = .secondaryOnly
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.preferredDisplayMode = .oneBesideSecondary
            }
        }
    }
}
