//
//  personaInfoViewController.swift
//  headwayTest
//
//  Created by 华元信息部_相科峰 on 2017/9/29.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class personaInfoViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    //放弃使用纯代码了...还是使用autolayout比较方便= =
    //这里如果使用纯代码的话，可能引起两个view之间的显示冲突
//    let personalInfoTableView : UITableView = {
//        return UITableView(frame:UIScreen.main.bounds,style:.grouped)
//    }()
    @IBOutlet weak var personalInfoTableView: UITableView!
    //这是数据源...
    let informations : [String] = ["头像","昵称","业主名","性别","手机号"]
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalInfoTableView.reloadData()
        personalInfoTableView.delegate = self
        personalInfoTableView.dataSource = self
        personalInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "personalInfoReuseId")
        self.view.addSubview(personalInfoTableView)
        
        
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell = UITableViewCell(style: .value1, reuseIdentifier: "personalInfoReuseId")
        singleCell.accessoryType = .disclosureIndicator
        singleCell.textLabel?.text = informations[indexPath.row]
        switch indexPath.row {
        case 0:
            break
        case 1:
            //不知道为什么这里的value一直显示还没设置的状态，难道是因为换了个界面就不存在了？...一波问题
            print("这里有个测试节点")
            let tool = dataStoreTool()
            if(!tool.dataIsSet(key: "newName")){
                let newName = tool.getNormalDefult(key: "newName") as! String
                singleCell.detailTextLabel?.text = newName
                print(newName)
            }else{
                singleCell.detailTextLabel?.text = "未设置昵称"
                print("还没设置")
            }
            
        default:
            break
        }
        
        return singleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            //这个是弹出提示框，提示要使用哪种方式进行选取头像
            let alertSheet = UIAlertController(title: "请选择选取方式", message: nil, preferredStyle: .actionSheet)
            let cancelButton = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let cameraAciton = UIAlertAction(title: "拍照选取", style: .default, handler:{
                (action: UIAlertAction)-> Void in
                if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                    let picker = UIImagePickerController()
                    picker.sourceType = .camera
                    picker.delegate = self
                    picker.allowsEditing = true
                    self.present(picker, animated: true, completion: nil)
                }else{
                    print("该设备无法使用相机功能")
                }
            })
            let photoAction = UIAlertAction(title: "相册选取", style: .default, handler: {
                (action: UIAlertAction) ->Void in
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
            })
            alertSheet.addAction(cameraAciton)
            alertSheet.addAction(photoAction)
            alertSheet.addAction(cancelButton)
            self.present(alertSheet, animated: true, completion: nil)
            break
        case 1:
            let mainSB = UIStoryboard(name: "Main", bundle: nil)
            let nickNameChangeVC = mainSB.instantiateViewController(withIdentifier: "nickNameChangeVC")
            self.present(nickNameChangeVC, animated: true, completion: nil)
            break
        default:
            break
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("调用")
        personalInfoTableView.reloadData()
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
