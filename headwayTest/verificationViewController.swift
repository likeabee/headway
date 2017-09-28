//
//  verificationViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/19.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire

class verificationViewController: UIViewController, MFMessageComposeViewControllerDelegate{
    @IBOutlet weak var getVerificationCodeButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    let verificationCode = randomVerificationCode().randomCode()
    //这是手机号码输入框
    @IBOutlet weak var phoneNumberTextField: UITextField!
    //这是短信验证码输入框
    @IBOutlet weak var verificationCodeTextField: UITextField!
    //这是获取验证码按钮
    @IBAction func getVerificationCodeButton(_ sender: UIButton) {
        //这里添加获取验证码方法
        if(phoneNumberTextField.text == "" || phoneNumberTextField.text?.characters.count != 11){
            let warnAlert = UIAlertController(title: "提示", message: "请输入正确手机号", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }else{
            print(verificationCode)
            print("输入格式正确")
                //这里应该再加一个把button设置为disable的状态设置,已设置，封装的类buttonCount()只需传参UIButton和time(自己设置所需的定时时长)
            buttonCount().buttonCounter(sendButton: getVerificationCodeButton, time: 10)
            
            //这里添加发送短信代码，现在写的代码虽然能够正常运作，但是一旦跳转到短信发送界面将无法实现回跳...有待改进
            
            let phoneNumber = self.phoneNumberTextField.text!
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
            
            
            
//            if(MFMessageComposeViewController.canSendText()){
//                print("正在发短信")
//                MFMessageComposeViewController.cancelPreviousPerformRequests(withTarget: self)
//                let messageSender = MFMessageComposeViewController()
//                messageSender.body = verificationCode
//                messageSender.recipients = ["\(phoneNumberTextField.text!)"]
//                delay(0.1, task: {
//                    self.present(messageSender, animated: true, completion: nil)
//                })
//                //self.present(messageSender, animated: true, completion: nil)
//                //messageSender.dismiss(animated: true, completion: nil)
//                
//            }else{
//                print("发送失败")
//            }
        }
    }
    @IBAction func verifyButton(_ sender: UIButton) {
        //这里添加验证验证码与输入验证码是否相同判断，并作出相应跳转操作
        if(verificationCodeTextField.text == ""){
            let warnAlert = UIAlertController(title: "提示", message: "请输入正确验证码", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }else if(verificationCode == verificationCodeTextField.text!){
            print("验证成功")
            //这里添加跳转操作,跳转完成的界面应与正常登陆时界面一致，（可以考虑给出一个修改密码的提示）...
        }else{
            let warnAlert = UIAlertController(title: "提示", message: "验证码错误", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "重新输入", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }
    }

    //这是代理，在短息发送以后调用，实现回调
    @nonobjc func messageComposeViewController(controller: MFMessageComposeViewController!,
                                      didFinishWith result: MessageComposeResult)
    {
        print("test")
        controller.dismiss(animated: true, completion: nil)
        //            switch result.value
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: {
            
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getVerificationCodeButton.layer.cornerRadius = 5
        verifyButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }

    func barButtonItemClicked(){
        self.present(self, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
        verificationCodeTextField.resignFirstResponder()
    }
    
    
//    func checkPhoneNumber(phoneNumber : String?){
//        if(phoneNumber != nil && phoneNumber != ""){
//            phoneNumber?.characters.count
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
