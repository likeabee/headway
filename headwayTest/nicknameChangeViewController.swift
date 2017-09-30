
//
//  nicknameChangeViewController.swift
//  headwayTest
//
//  Created by 华元信息部_相科峰 on 2017/9/29.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class nicknameChangeViewController: UIViewController {
    let tool = dataStoreTool()
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var newNicknameTextField: UITextField!
    @IBOutlet weak var confirmButtonOutlet: UIButton!
    
    @IBAction func confirmButton(_ sender: UIButton) {
        let newNickname = newNicknameTextField.text
        
        tool.setNormalDefault(key: "newName",value: newNickname)
        print("测试一波...")
        let name = tool.getNormalDefult(key: "newName")
        print(name!)
        
        let alertView = UIAlertController(title: "提示", message: "修改成功", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确定", style: .cancel, handler:{
            (action: UIAlertAction) ->Void in
            self.dismiss(animated: true, completion: nil)
        })
        alertView.addAction(confirmAction)
//        let personalInfoVC = personaInfoViewController()
//        personalInfoVC.personalInfoTableView.reloadData()
        self.present(alertView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        confirmButtonOutlet.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        newNicknameTextField.resignFirstResponder()
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
