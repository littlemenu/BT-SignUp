//
//  UserInfomation.swift
//  SignUp
//
//  Created by 정재훈 on 14/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import Foundation

class UserInfomation {
    static let shared: UserInfomation = UserInfomation()
    
    var ID: String?
    var PW: String?
    var PWR: String?
    var UserText: String?
    
    var PhoneNumber: String?
    var BirthDayDate: String?
}
