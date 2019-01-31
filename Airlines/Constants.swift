//
//  Constants.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/29/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import Foundation

struct Constants {
    struct Enums {
        struct Login {
            enum CellIndex: Int {
                case header
                case userID
                case password
                case stationCode
                case login
            }
            enum CellID: String {
                case headerCell
                case userIDCell
                case passwordCell
                case stationCodeCell
                case loginButtonCell
            }
            enum MaxChars: Int {
                case userID = 6
                case password = 8
                case stationCode = 3
            }
        }
    }
    struct Texts {
        struct Login {
            static let userIdHintText = "Please enter a valid user id"
            static let userIdErrorText = "6 digit AA ID"
            static let passwordHintText = "Please enter a valid password"
            static let passwordErrorText = "8 characters minimun"
            static let stationCodeHintText = "Please enter a valid station code"
            static let stationCodeErrorText = "3 letter station code"
        }
    }
}
