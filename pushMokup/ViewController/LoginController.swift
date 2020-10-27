//
//  LoginController.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var fieldId: UITextField!
    @IBOutlet weak var fieldPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldId.autocapitalizationType = .none
        fieldId.autocorrectionType = .no
        fieldId.keyboardType = .asciiCapable
        fieldPw.isSecureTextEntry = true
    }
    
    @IBAction func moveMain(_ sender: Any) {
        // 메인화면 이동
        AppNavigator.shared.main()
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
}

extension LoginController {
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}

extension MainViewController {
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}

extension SecondViewController {
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
