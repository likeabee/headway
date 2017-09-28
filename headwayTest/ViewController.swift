//
//  ViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/18.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //这是位于底层的背景图片
    @IBOutlet weak var backgroundImageView: UIImageView!
    //这是登录按钮outlet
    @IBOutlet weak var loginButton: UIButton!
    //这是账号输入文本框
    @IBOutlet weak var accountText: UITextField!
    //这是密码输入文本框
    @IBOutlet weak var passwordText: UITextField!
    //这是登录按钮action
    @IBAction func loginButton(_ sender: UIButton) {
        if((accountText.text) == ""){
            //设置空白填写报错
            let warnAlert = UIAlertController(title: "提示", message: "请先填写账号", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }else if(passwordText.text == ""){
            //设置空白填写报错
            let warnAlert = UIAlertController(title: "提示", message: "请先填写密码", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }else{
            //这里添加下一个跳转的view
            print("OK")
            let mainSB = UIStoryboard(name: "Main", bundle: nil)
            let homePage = mainSB.instantiateViewController(withIdentifier: "homePage")
            //这里只是一个简单的判断，并没有作出后代验证，有待更新...
            if(accountText.text == passwordText.text){
                self.present(homePage, animated: true, completion: nil)
            }
        }
    }
    //实际中，这里运用了storyboard的segue跳转方法...
    @IBAction func registerButton(_ sender: UIButton) {
        //这里添加注册view
    }
    
    @IBAction func forgetButton(_ sender: UIButton) {
        //这里添加手机验证登录view
    }
    
    @IBAction func visitorButton(_ sender: UIButton) {
        //这里添加游客登录直接进入app view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        //这里创建模糊视图效果，也就是毛玻璃效果，所有在这个视图下方的视图都会被模糊
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        backgroundImageView.addSubview(blurView)
        ////////分割线////////这里涉及到代码和故事板创建的视图谁先加载的问题
        loginButton.layer.cornerRadius = 15
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: nil, action: nil)
        let navigationTitleAttribute : NSDictionary = NSDictionary(object: UIColor.white, forKey: NSForegroundColorAttributeName as NSCopying)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as! [AnyHashable: Any] as? [String :AnyObject]
        //let barBGImage = UIImage(named: "纯黑BG.png")
        //self.navigationController?.navigationBar.setBackgroundImage(barBGImage, for: UIBarMetrics.default)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //点击空白处收起键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        accountText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }

//隐藏系统状态栏
//    override var prefersStatusBarHidden: Bool{
//        return true
//    }
}

