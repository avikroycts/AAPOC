//
//  LoginButtonTableViewCell.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/22/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import UIKit

protocol LoginButtonTableViewCellDelegate:class {
    func login()
}

class LoginButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loginButton: UIButton!
    weak var delegate: LoginButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        delegate?.login()
    }
}
