//
//  SettingsServerNameTableViewCell.swift
//  ArkMonitor
//
//  Created by Andrew on 2017-09-15.
//  Copyright © 2017 vrlc92. All rights reserved.
//

import UIKit

protocol SettingsServerNameTableViewCellDelegate: class {
    func ipCell(_ cell: SettingsServerNameTableViewCell, didChangeText text: String?)
}

class SettingsServerNameTableViewCell: UITableViewCell {
    
    public weak var delegate: SettingsServerNameTableViewCellDelegate?
    
    var nameLabel      : UILabel!
    var nameTextField  : ArkTextField!
    
    init(_ mode: Server) {
        super.init(style: .default, reuseIdentifier: "servername")
        
        backgroundColor = ArkPalette.secondaryBackgroundColor
        selectionStyle = .none
        
        let nameLabel = UILabel()
        nameLabel.text          = "Server name"
        nameLabel.textColor     = ArkPalette.highlightedTextColor
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 16.0, weight:  ArkPalette.fontWeight)
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(25.0)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        nameTextField = ArkTextField(settings: true, placeHolder: "Custom Server")
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { (make) in
            make.height.equalTo(30.0)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-25.0)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        let seperator = UIView()
        seperator.backgroundColor = ArkPalette.tertiaryBackgroundColor
        addSubview(seperator)
        seperator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(_ ipAddress: String?) {
        nameTextField.text = ipAddress
    }
}

// MARK: UITextFieldDelegate
extension SettingsServerNameTableViewCell : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.ipCell(self, didChangeText: textField.text)
    }
}
