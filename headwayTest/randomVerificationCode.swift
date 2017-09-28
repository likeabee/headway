//
//  randomVerificationCode.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/19.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import Foundation
class randomVerificationCode{
    func randomCode() -> String {
        let first = arc4random() % 10
        let second = arc4random() % 10
        let third = arc4random() % 10
        let forth = arc4random() % 10
        let code = "\(first)"+"\(second)"+"\(third)"+"\(forth)"
        return code
    }
    
}
