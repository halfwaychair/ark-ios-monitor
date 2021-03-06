//
//  ArkActivityView.swift
//  ArkMonitor
//
//  Created by Andrew on 2017-09-11.
//  Copyright © 2017 vrlc92. All rights reserved.
//

import UIKit
import NotificationBannerSwift

public struct ArkActivityView  {
    
    static public func showMessage(_ text: String) {
        let banner = StatusBarNotificationBanner(title: text, style: .warning, colors: CustomBannerColors())
        banner.duration = 2.0
        banner.show()
    }
    
    static public func showSuccessMessage(_ text: String) {
        let banner = StatusBarNotificationBanner(title: text, style: .success, colors: CustomBannerColors())
        banner.duration = 2.0
        banner.show()
    }
}

fileprivate class CustomBannerColors: BannerColorsProtocol {
    
    func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger:
            return ArkPalette.textColor
        case .info:     // Your custom .info color
            return ArkPalette.textColor
        case .none:     // Your custom .none color
            return ArkPalette.textColor
        case .success:  // Your custom .success color
            return ArkPalette.accentColor
        case .warning:  // Your custom .warning color
            return ArkPalette.textColor
        }
    }
}

