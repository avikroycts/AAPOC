//
//  LoginTableViewCell.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/22/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var userIDHintLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordHintLabel: UILabel!
    
    @IBOutlet weak var stationCodeTextField: UITextField!
    @IBOutlet weak var stationCodeHintLabel: UILabel!
    
    var isInvalidUserID: Bool? {
        didSet {
            updateUserIdHintText()
        }
    }
    var isInvalidPassword: Bool? {
        didSet {
            updatePasswordHintText()
        }
    }
    var isInvalidStationCode: Bool? {
        didSet {
            updateStationCodeHintText()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUserIdHintText() {
        if isInvalidUserID ?? false {
            userIDHintLabel.text = Constants.Texts.Login.userIdHintText
            userIDHintLabel.textColor = .red
        } else {
            userIDHintLabel.text = Constants.Texts.Login.userIdErrorText
            userIDHintLabel.textColor = .darkGray
        }
    }
    func updatePasswordHintText() {
        if isInvalidPassword ?? false {
            passwordHintLabel.text = Constants.Texts.Login.passwordHintText
            passwordHintLabel.textColor = .red
        } else {
            passwordHintLabel.text = Constants.Texts.Login.passwordErrorText
            passwordHintLabel.textColor = .darkGray
        }
    }
    func updateStationCodeHintText() {
        if isInvalidStationCode ?? false {
            stationCodeHintLabel.text = Constants.Texts.Login.stationCodeHintText
            stationCodeHintLabel.textColor = .red
        } else {
            stationCodeHintLabel.text = Constants.Texts.Login.stationCodeErrorText
            stationCodeHintLabel.textColor = .darkGray
        }
    }
}
