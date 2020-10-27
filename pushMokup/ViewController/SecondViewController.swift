//
//  SecondViewController.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit

class SecondViewController: UIViewController {
    // 부모로 사용되는 SplitView
    var splitView:SplitViewController?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var labelContent: UILabel!
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = "시스템 점검 \(index)"
        labelContent.text = "보안정책 변경으로 인한 시스템 점검 \(index)"

        if Singletone.data.deviceIdiom == .phone {
            buttonBack.isHidden = false
        } else {
            buttonBack.isHidden = false

            buttonBack.setTitle("", for: .normal)
            buttonBack.setImage(UIImage(systemName: "sidebar.left"), for:.normal)
        }
        
        // 네비게이션을 숨김처리해도 스와이프를 이용한 뒤로가기 동작을 수행할 수 있게 된다.
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
   
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if self.buttonBack == nil {
            return
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        if Singletone.data.deviceIdiom == .phone {
            if let navController = splitViewController?.viewControllers[0] as? UINavigationController {
                navController.popViewController(animated: true)
            }
            return
        }
        
        // 태블릿이 3번 인덱스 일때, 메뉴는 닫는다.
        self.splitView?.toggleMasterView()
        
    }
}

