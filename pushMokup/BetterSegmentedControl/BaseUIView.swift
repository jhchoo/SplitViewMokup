//
//  BaseUIView.swift
//  ERS
//
//  Created by jae hwan choo on 2020/07/16.
//  Copyright © 2020 emf. All rights reserved.
//

import UIKit
/**
 # view 클래스와 xib 화면을 연결
 */
class BaseUIView: UIView {
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    // MARK: - 초기설정
    func setupView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    /// 초기설정
    func loadViewFromNib() -> UIView? {
        let xibName: String = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: xibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
