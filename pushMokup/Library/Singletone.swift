//
//  Singletone.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/23.
//

import UIKit

class Singletone: NSObject {
    // MARK: 변수
    static let data = Singletone()
    
    var mainListVC: MainListViewController?

    // 패드
    let deviceIdiom = UIDevice.current.userInterfaceIdiom
    
    var selectIndex: Int = 0 {
        didSet {
            if let mainListVC = self.mainListVC {
                if selectIndex == 0 {
                    mainListVC.textTitle.text = "오늘 NEW"
                } else {
                    mainListVC.textTitle.text = "전체 ALL"
                }
            }
        }
    }
}
