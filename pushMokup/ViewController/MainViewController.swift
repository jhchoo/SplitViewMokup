//
//  MainViewController.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/22.
//

import UIKit

class MainViewController: UIViewController {
    // 부모로 사용되는 SplitView
    var splitView:SplitViewController?

    // 커스텀 세그먼트 뷰
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let iconsSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height),
            segments: IconSegment.segments(withTitles: ["5", "99+"],
                                           withIcons: [UIImage(named: "facebook")!, UIImage(named: "twitter")!],
                                           iconSize: CGSize(width: 20.0, height: 20.0),
                                           normalIconTintColor: rgb(red: 200, green: 222, blue: 235),
                                           selectedIconTintColor: rgb(red: 5, green: 53, blue: 144)),
            options: [.cornerRadius(15.0),
                      .backgroundColor(rgb(red: 5, green: 53, blue: 144)),
                      .indicatorViewBackgroundColor(rgb(red: 200, green: 222, blue: 235))])
        iconsSegmentedControl.center.x = view.center.x
        iconsSegmentedControl.addTarget(self, action: #selector(segmentedControl1ValueChanged(_:)), for: .valueChanged)
        container.addSubview(iconsSegmentedControl)
        
        iconsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconsSegmentedControl.topAnchor.constraint(equalTo: container.topAnchor),
            iconsSegmentedControl.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            iconsSegmentedControl.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            iconsSegmentedControl.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            ])
        
        // 기본값 설정.
        Singletone.data.selectIndex = 0
        
        // 네비게이션을 숨김처리해도 스와이프를 이용한 뒤로가기 동작을 수행할 수 있게 된다.
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index)")
        Singletone.data.selectIndex = sender.index
    }
        
    
    @IBAction func actionLogout(_ sender: Any) {
        AppNavigator.shared.Login()
    }
    
    func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(red: CGFloat(Float(red) / 255.0),
            green: CGFloat(Float(green) / 255.0),
            blue: CGFloat(Float(blue) / 255.0),
            alpha: CGFloat(1.0))
    }
}
