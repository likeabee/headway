//
//  personalViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/28.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class personalViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    let personalTableView : UITableView = {
        return UITableView(frame: UIScreen.main.bounds, style: .grouped )
    }()
    
    var imageArray = [[String]]()
    var titleArray = [[String]]()
    //返回按钮
    let backButton = UIButton(frame: CGRect(origin: CGPoint.init(x: 10, y: 20), size: CGSize(width: 60, height: 40)))
    let personalHeaderView = Bundle.main.loadNibNamed("personalHeaderView", owner: nil, options: [:])?.last as? personalHeaderView
    override func viewDidLoad() {
        super.viewDidLoad()

        personalTableView.delegate = self
        personalTableView.dataSource = self
        personalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseId")
        
        view.addSubview(personalTableView)
        titleArray = [["我的房屋","我的车辆"],["我的订单","我的接单"],["我的缴费","我的报修","我的反馈"]]
        imageArray = [["房屋","车辆"],["订单","接单"],["缴费","报修","反馈"]]
        
        personalHeaderView?.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width, height: 200))
        personalHeaderView?.headImageButton.addTarget(self, action: #selector(self.headImageButtonClicked), for: UIControlEvents.touchUpInside)
        let tool = dataStoreTool()
        let newName = tool.getNormalDefult(key: "newName")
        if(tool.isKeyPresentInUserDefaults(key: "newName")){
            personalHeaderView?.nickNameLable.text = newName
            print(newName!+"这是新的测试")
            self.personalHeaderView?.addSubview((personalHeaderView?.nickNameLable)!)
        }else{
            personalHeaderView?.nickNameLable.text = "未设置昵称"
            print("还没设置")
        }
//        personalHeaderView?.headImageButton.setBackgroundImage(self.getImage(), for: .normal)
        personalHeaderView?.imageView.image = getImage()
        personalHeaderView?.imageView.layer.cornerRadius = (personalHeaderView?.imageView.frame.width)! / 2
        personalTableView.tableHeaderView = personalHeaderView
        personalTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        personalTableView.sectionFooterHeight = 0
        personalHeaderView?.headImageButton.layer.cornerRadius = (personalHeaderView?.headImageButton.frame.width)! / 2
        backButton.setTitle("<返回", for: .normal)
//        backButton.setTitleColor(UIColor.blue, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonClicked), for: UIControlEvents.touchUpInside)
        view.addSubview(backButton)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell = UITableViewCell(style: .value1, reuseIdentifier: "cellReuseId")
        singleCell.accessoryType = .disclosureIndicator
        singleCell.imageView?.image = UIImage(named: imageArray[indexPath.section][indexPath.row])
        singleCell.textLabel?.text = titleArray[indexPath.section][indexPath.row]
        return singleCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        personalTableView.deselectRow(at: indexPath, animated: true)
//        let titleString = titleArray[indexPath.section][indexPath.row]
//        self.performSegue(withIdentifier: "showPersonalDetail", sender: titleString)
        switch indexPath.section{
            case 0:
                switch indexPath.row{
                case 0:
                    //这里是我的房屋界面
                    break
                case 1:
                    //这里是我的车辆界面
                    break
                default:
                    break
                }
            case 1:
                switch indexPath.row{
                case 0:
                    //这里是我的订单界面
                    break
                case 1:
                    //这里是我的接单界面
                    break
                default:
                    break
                }
            case 2:
                switch indexPath.row{
                case 0:
                  //这里是我的缴费界面
                    print("case被调用了")
                    let mainSB = UIStoryboard(name: "Main", bundle: nil)
                    let feesPaymentVC = mainSB.instantiateViewController(withIdentifier: "feesPaymentRecordVC")
                    //            let feesPaymentVC = paymentRecordViewController()
                    self.present(feesPaymentVC, animated: true, completion: nil)
                case 1:
                   //这里是我的报修界面
                    break
                case 2:
                    //这里是我的反馈界面
                    break
                default:
                    break
            }
            default:
                break
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "showPersonalDetail"){
//
//        }
//    }
    func backButtonClicked(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func headImageButtonClicked(){
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let personalInfoVC = mainSB.instantiateViewController(withIdentifier: "personalInfoVC")
        self.present(personalInfoVC, animated: true, completion: nil)
    }
    
    func getImage() -> UIImage?{
        //home目录
        let homeDirectory = NSHomeDirectory()
        let documentPath = homeDirectory + "/Documents"
        //文件管理器
        let fileManager = FileManager.default
        let filePath = documentPath + "/image.png"
        let isExist = fileManager.fileExists(atPath: filePath)
        if(isExist){
            let image = UIImage(contentsOfFile: filePath)
            self.personalHeaderView?.headImageButton.setTitle("", for: .normal)
            return image!
        }else{
            return nil
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.personalHeaderView?.headImageButton.layer.cornerRadius = (personalHeaderView?.headImageButton.bounds.width)! / 2
//        self.personalHeaderView?.headImageButton.setBackgroundImage(getImage(), for: .normal)
        self.personalHeaderView?.imageView.image = getImage()
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
