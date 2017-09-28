//
//  hwNavigationC.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/18.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class hwNavigationC : UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarTitle = "我是业主"
        self.title = navBarTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: nil)
        self.navigationBar.barTintColor = UIColor.white
    }
    
}
