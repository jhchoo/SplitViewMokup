//
//  IconSegment.swift
//  BetterSegmentedControl
//
//  Created by George Marmaridis on 10/02/2018.
//

#if canImport(UIKit)

import UIKit

open class IconSegment: BetterSegmentedControlSegment {
    // MARK: Constants
    private struct DefaultValues {
        static let normalBackgroundColor: UIColor = .clear
        static let selectedBackgroundColor: UIColor = .clear
    }
    
    // MARK: Properties
    public let text: String?
    public var icon: UIImage
    public var iconSize: CGSize
    
    public var normalIconTintColor: UIColor
    public var normalBackgroundColor: UIColor
    
    public var selectedIconTintColor: UIColor
    public var selectedBackgroundColor: UIColor
    
    // MARK: Lifecycle
    public init(text: String? = nil,
                icon: UIImage,
                iconSize: CGSize,
                normalBackgroundColor: UIColor? = nil,
                normalIconTintColor: UIColor,
                selectedBackgroundColor: UIColor? = nil,
                selectedIconTintColor: UIColor) {
        self.text = text
        self.icon = icon.withRenderingMode(.alwaysTemplate)
        self.iconSize = iconSize
        self.normalBackgroundColor = normalBackgroundColor ?? DefaultValues.normalBackgroundColor
        self.normalIconTintColor = normalIconTintColor
        self.selectedBackgroundColor = selectedBackgroundColor ?? DefaultValues.selectedBackgroundColor
        self.selectedIconTintColor = selectedIconTintColor
    }
    
    // MARK: BetterSegmentedControlSegment
    public var intrinsicContentSize: CGSize? { nil }
    
    public lazy var normalView: UIView = {
        return createView(withText: text,
                          withIcon: icon,
                          iconSize: iconSize,
                          backgroundColor: normalBackgroundColor,
                          iconTintColor: normalIconTintColor)
    }()
    public lazy var selectedView: UIView = {
       return createView(withText: text,
                         withIcon: icon,
                         iconSize: iconSize,
                         backgroundColor: selectedBackgroundColor,
                         iconTintColor: selectedIconTintColor)
    }()
    private func createView(withText text: String?,
                            withIcon icon: UIImage,
                            iconSize: CGSize,
                            backgroundColor: UIColor,
                            iconTintColor: UIColor) -> UIView {
        let view = CustomSegmentView()
        view.backgroundColor = backgroundColor
        view.imageIcon.image = icon
        view.imageIcon.tintColor = iconTintColor

        view.textLabel.text = text
        view.textLabel.backgroundColor = backgroundColor
        view.textLabel.textColor = iconTintColor

        return view
    }
}

public extension IconSegment {
    class func segments(withTitles titles: [String],
                        withIcons icons: [UIImage],
                        iconSize: CGSize,
                        normalBackgroundColor: UIColor? = nil,
                        normalIconTintColor: UIColor,
                        selectedBackgroundColor: UIColor? = nil,
                        selectedIconTintColor: UIColor) -> [BetterSegmentedControlSegment] {
        
        var array: [BetterSegmentedControlSegment] = [BetterSegmentedControlSegment]()
        
        for (index, item) in icons.enumerated() {
            let make = IconSegment(text: titles[index],
                        icon: item,
                        iconSize: iconSize,
                        normalBackgroundColor: normalBackgroundColor,
                        normalIconTintColor: normalIconTintColor,
                        selectedBackgroundColor: selectedBackgroundColor,
                        selectedIconTintColor: selectedIconTintColor)
            
            array.append(make)
        }
        
        return array
    }
}

#endif
