//
//  SettingSelectionTableViewCell.swift
//  ArkMonitor
//
//  Created by Andrew on 2017-09-14.
//  Copyright © 2017 vrlc92. All rights reserved.
//

import UIKit

class SettingSelectionPresetTableViewCell: UITableViewCell {
    
    public  let mode      : Server
    private var nameLabel : UILabel!
    private var check     : UIImageView!

    
    init(_ mode: Server) {
        self.mode = mode
        super.init(style: .default, reuseIdentifier: "presetServer")
        
        backgroundColor = ArkPalette.secondaryBackgroundColor
        selectionStyle = .none
        
        nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.textColor = ArkPalette.highlightedTextColor
        nameLabel.font = UIFont.systemFont(ofSize: 16.0, weight:  ArkPalette.fontWeight)
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(12.5)
        }
        
        switch mode {
        case .arkNet1:
            nameLabel.text = "node1.arknet.cloud"
        default:
            nameLabel.text = "node2.arknet.cloud"
        }
        
        
        let checkImage = #imageLiteral(resourceName: "serverCheck")
        check = UIImageView()
        check.image = checkImage.maskWithColor(color: ArkPalette.accentColor)
        check.isHidden = true
        
        addSubview(check)
        check.snp.makeConstraints { (make) in
            make.height.width.equalTo(25.0)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12.5)
        }
        
        let seperator = UIView()
        seperator.backgroundColor = ArkPalette.tertiaryBackgroundColor
        addSubview(seperator)
        seperator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    public func setServerSelction(_ isCurrentServer: Bool) {
        let checkImage = #imageLiteral(resourceName: "serverCheck")
        check.image = checkImage.maskWithColor(color: ArkPalette.accentColor)
        if isCurrentServer == true {
            nameLabel.textColor = ArkPalette.accentColor
            check.isHidden = false
        } else {
            nameLabel.textColor = ArkPalette.highlightedTextColor
            check.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
