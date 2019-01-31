//
//  String+Extensions.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/29/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import Foundation

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && rangeOfCharacter(from: characters) == nil
    }
    var isAlpha: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
}
