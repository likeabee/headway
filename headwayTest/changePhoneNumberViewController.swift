//
//  changePhoneNumberViewController.swift
//  headwayTest
//
//  Created by 华元信息部_相科峰 on 2017/10/5.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit
import Alamofire
class changePhoneNumberViewController: UIViewController {
    //新手机号输入框
    @IBOutlet weak var newPhoneNumberTextField: UITextField!
    //验证码输入框
    @IBOutlet weak var verifyCodeTextField: UITextField!
    //获取验证码buttonOutlet
    @IBOutlet weak var verificationButtonOutlet: UIButton!
    //保存按钮outlet
    @IBOutlet weak var saveButtonOutlet: UIButton!
    //获取验证码button
    @IBAction func verificationButton(_ sender: UIButton) {
        //这里添加相应的获取验证码代码，同之前
        if(newPhoneNumberTextField.text == "" || newPhoneNumberTextField.text?.characters.count != 11){
            let alertController = UIAlertController(title: "警告", message: "请输入正确的手机号", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            print("输入正确")
            buttonCount().buttonCounter(sendButton: verificationButtonOutlet, time: 10)
            let phoneNumber = self.newPhoneNumberTextField.text!
            let url = URL(string: "192.168.15.97:8080/GetVerifyCode")!
            let phoneNumberData = phoneNumber.data(using: .utf8)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.httpBody = phoneNumberData
            //这里是测试Alamofire的代码，不知道好不好用
            Alamofire.request(request).validate().responseJSON(completionHandler: {
                (response) in
                switch response.result{
                case .success:
                    print("成功了")
                    print(response)
                case .failure:
                    print("失败了")
                }
            })
        }
    }
    //保存button
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
    //返回按钮
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verificationButtonOutlet.layer.cornerRadius = 5
        saveButtonOutlet.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
