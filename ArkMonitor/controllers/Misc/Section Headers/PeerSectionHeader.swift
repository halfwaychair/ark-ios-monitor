//
//  PeerSectionHeader.swift
//  ArkMonitor
//
//  Created by Andrew on 2017-09-11.
//  Copyright © 2017 vrlc92. All rights reserved.
//

import UIKit

class PeerSectionHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ArkPalette.backgroundColor

        let ipLabel = UILabel()
        ipLabel.textColor = ArkPalette.textColor
        ipLabel.text = "Ip Address"
        ipLabel.textAlignment = .center
        ipLabel.font = UIFont.systemFont(ofSize: 15.0, weight:  ArkPalette.fontWeight)
        addSubview(ipLabel)
        
        ipLabel.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3.0)
        }
        
        let portLabel = UILabel()
        portLabel.textColor = ArkPalette.textColor
        portLabel.text = "Port"
        portLabel.textAlignment = .center
        portLabel.font = UIFont.systemFont(ofSize: 15.0, weight:  ArkPalette.fontWeight)
        addSubview(portLabel)
        
        portLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(ipLabel.snp.right)
            make.width.equalToSuperview().dividedBy(3.0)
        }
        
        let versionLabel = UILabel()
        versionLabel.textColor = ArkPalette.textColor
        versionLabel.text = "Version"
        versionLabel.textAlignment = .center
        versionLabel.font = UIFont.systemFont(ofSize: 15.0, weight:  ArkPalette.fontWeight)
        addSubview(versionLabel)
        
        versionLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(portLabel.snp.right)
            make.width.equalToSuperview().dividedBy(3.0)
        }
        
        let seperator = UIView()
        seperator.backgroundColor = ArkPalette.tertiaryBackgroundColor
        addSubview(seperator)
        seperator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        let seperator2 = UIView()
        seperator2.backgroundColor = ArkPalette.tertiaryBackgroundColor
        addSubview(seperator2)
        seperator2.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
