//
//  ViewController.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/22/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import UIKit
import PKHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTableView: UITableView!
    
    var userIdCell:LoginTableViewCell!
    var passwordCell:LoginTableViewCell!
    var stationCodeCell:LoginTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "American Airlines"
        loginTableView.rowHeight = UITableView.automaticDimension
        loginTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(with notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        var contentInset = self.loginTableView.contentInset
        contentInset.bottom += keyboardFrame.height
        
        self.loginTableView.contentInset = contentInset
        self.loginTableView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide(with notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        var contentInset = self.loginTableView.contentInset
        contentInset.bottom -= keyboardFrame.height
        
        self.loginTableView.contentInset = contentInset
        self.loginTableView.scrollIndicatorInsets = contentInset
    }
    
}

extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func configureHeaderCell(_ tableView: UITableView, _ indexPath: IndexPath, _ cell: inout UITableViewCell?) {
        let headerCell  = tableView.dequeueReusableCell(withIdentifier: Constants.Enums.Login.CellID.headerCell.rawValue, for: indexPath)
        cell = headerCell
    }
    
    fileprivate func configureUserIdCell(_ tableView: UITableView, _ indexPath: IndexPath, _ cell: inout UITableViewCell?) {
        self.userIdCell  = tableView.dequeueReusableCell(withIdentifier: Constants.Enums.Login.CellID.userIDCell.rawValue, for: indexPath) as? LoginTableViewCell
        self.userIdCell.userIDTextField.tag = indexPath.row
        self.userIdCell.userIDTextField.delegate = self as UITextFieldDelegate
        self.userIdCell.isInvalidUserID = false
        cell = self.userIdCell
    }
    
    fileprivate func configurePasswordCell(_ tableView: UITableView, _ indexPath: IndexPath, _ cell: inout UITableViewCell?) {
        self.passwordCell  = tableView.dequeueReusableCell(withIdentifier: Constants.Enums.Login.CellID.passwordCell.rawValue, for: indexPath) as? LoginTableViewCell
        self.passwordCell.passwordTextField.tag = indexPath.row
        self.passwordCell.passwordTextField.delegate = self as UITextFieldDelegate
        self.passwordCell.isInvalidPassword = false
        cell = self.passwordCell
    }
    
    fileprivate func configureStationCodeCell(_ tableView: UITableView, _ indexPath: IndexPath, _ cell: inout UITableViewCell?) {
        self.stationCodeCell  = tableView.dequeueReusableCell(withIdentifier: Constants.Enums.Login.CellID.stationCodeCell.rawValue, for: indexPath) as? LoginTableViewCell
        self.stationCodeCell.stationCodeTextField.tag = indexPath.row
        self.stationCodeCell.stationCodeTextField.delegate = self as UITextFieldDelegate
        self.stationCodeCell.isInvalidStationCode = false
        cell = self.stationCodeCell
    }
    
    fileprivate func configureLoginButtonCell(_ tableView: UITableView, _ indexPath: IndexPath, _ cell: inout UITableViewCell?) {
        let loginButtonCell  = tableView.dequeueReusableCell(withIdentifier: Constants.Enums.Login.CellID.loginButtonCell.rawValue, for: indexPath) as! LoginButtonTableViewCell
        loginButtonCell.delegate = self
        cell = loginButtonCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        switch indexPath.row {
        case Constants.Enums.Login.CellIndex.header.rawValue:
            configureHeaderCell(tableView, indexPath, &cell)
        case Constants.Enums.Login.CellIndex.userID.rawValue:
            configureUserIdCell(tableView, indexPath, &cell)
        case Constants.Enums.Login.CellIndex.password.rawValue:
            configurePasswordCell(tableView, indexPath, &cell)
        case Constants.Enums.Login.CellIndex.stationCode.rawValue:
            configureStationCodeCell(tableView, indexPath, &cell)
        case Constants.Enums.Login.CellIndex.login.rawValue:
            configureLoginButtonCell(tableView, indexPath, &cell)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension LoginViewController: LoginButtonTableViewCellDelegate {
    
    fileprivate func validateUserId() -> Bool? {
        if let userIDCell = self.userIdCell {
            if let userID = userIDCell.userIDTextField.text {
                if userID.count < Constants.Enums.Login.MaxChars.userID.rawValue || !userID.isNumber {
                    userIDCell.isInvalidUserID = true
                    return nil
                } else {
                    userIDCell.isInvalidUserID = false
                    return true
                }
            } else {
                userIDCell.isInvalidUserID = true
                return nil
            }
        }
        return nil
    }
    
    fileprivate func validatePassword() -> Bool? {
        if let passwordCell = self.passwordCell {
            if let password = passwordCell.passwordTextField.text {
                if password.count < Constants.Enums.Login.MaxChars.password.rawValue {
                    passwordCell.isInvalidPassword = true
                    return nil
                } else {
                    passwordCell.isInvalidPassword = false
                    return true
                }
            } else {
                passwordCell.isInvalidPassword = true
                return nil
            }
        }
        return nil
    }
    
    fileprivate func validateStationCode() -> Bool? {
        if let stationCodeCell = self.stationCodeCell {
            if let stationCode = stationCodeCell.stationCodeTextField.text {
                if stationCode.count < Constants.Enums.Login.MaxChars.stationCode.rawValue || !stationCode.isAlpha {
                    stationCodeCell.isInvalidStationCode = true
                    return nil
                } else {
                    stationCodeCell.isInvalidStationCode = false
                    return true
                }
            } else {
                stationCodeCell.isInvalidStationCode = true
                return nil
            }
        }
        return nil
    }
    
    func login() {
//        guard let _ = validateUserId() else {
//            print("Invalid userId:")
//            return
//        }
//        guard let _ =  validatePassword() else {
//            print("Invalid passowrd:")
//            return
//        }
//        guard let _ =  validateStationCode() else {
//            print("Invalid stationCode:")
//            return
//        }
        loginAPI()
    }
    
    func loginAPI() {
        view.endEditing(true)
        self.performSegue(withIdentifier: "LoginToTabbarVC", sender: self)
        return
        let urlString = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: urlString) else { return }
        
        HUD.show(.labeledProgress(title: "Signing In...", subtitle: ""))
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print(user.userId)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    HUD.show(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        HUD.hide()
                        self.performSegue(withIdentifier: "LoginToTabbarVC", sender: self)
                    })
                })
            } catch let jsonErr {
                HUD.hide()
                print("Error serialising json:", jsonErr.localizedDescription)
            }
            }.resume()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case Constants.Enums.Login.CellIndex.userID.rawValue:
            if let userIDCell = self.userIdCell {
                userIDCell.isInvalidUserID = false
            }
        case Constants.Enums.Login.CellIndex.password.rawValue:
            if let passwordCell = self.passwordCell {
                passwordCell.isInvalidPassword = false
            }
        case Constants.Enums.Login.CellIndex.stationCode.rawValue:
            if let stationCodeCell = self.stationCodeCell {
                stationCodeCell.isInvalidStationCode = false
            }
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case Constants.Enums.Login.CellIndex.userID.rawValue:
            _ = validateUserId()
        case Constants.Enums.Login.CellIndex.password.rawValue:
            _ = validatePassword()
        case Constants.Enums.Login.CellIndex.stationCode.rawValue:
            _ = validateStationCode()
        default:
            break
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        switch textField.tag {
        case Constants.Enums.Login.CellIndex.userID.rawValue:
            return count <= Constants.Enums.Login.MaxChars.userID.rawValue
        case Constants.Enums.Login.CellIndex.password.rawValue:
            return count <= Constants.Enums.Login.MaxChars.password.rawValue
        case Constants.Enums.Login.CellIndex.stationCode.rawValue:
            return count <= Constants.Enums.Login.MaxChars.stationCode.rawValue
        default:
            break
        }
        return true
    }
}

