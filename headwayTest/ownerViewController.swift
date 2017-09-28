//
//  ownerViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/20.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class ownerViewController: UIViewController {
    //这是业主姓名输入框
    @IBOutlet weak var ownerNameTextField: UITextField!
    //这是业主手机号输入框
    @IBOutlet weak var ownerPhoneNumber: UITextField!
    //这是验证码输入框
    @IBOutlet weak var verificationCodeTextField: UITextField!
    //这是业主身份证输入框
    @IBOutlet weak var ownerIdTextField: UITextField!
    //这是第一次密码输入框
    @IBOutlet weak var firstPasswordTextField: UITextField!
    //这是第二次密码输入框
    @IBOutlet weak var secondPasswordTextField: UITextField!
    //这是开始认证按钮outlet
    @IBOutlet weak var confirmButton: UIButton!
    //这是开始认证按钮action
    @IBAction func confirmButton(_ sender: UIButton) {
        //这里添加点击认证按钮以后的代码，处理认证信息的验证以及跳转
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        ownerNameTextField.layer.cornerRadius = 5
        ownerIdTextField.layer.cornerRadius = 5
        ownerPhoneNumber.layer.cornerRadius = 5
        verificationCodeTextField.layer.cornerRadius = 5
        firstPasswordTextField.layer.cornerRadius = 5
        secondPasswordTextField.layer.cornerRadius = 5
        confirmButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        ownerNameTextField.resignFirstResponder()
        ownerIdTextField.resignFirstResponder()
        ownerPhoneNumber.resignFirstResponder()
        verificationCodeTextField.resignFirstResponder()
        firstPasswordTextField.resignFirstResponder()
        secondPasswordTextField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
