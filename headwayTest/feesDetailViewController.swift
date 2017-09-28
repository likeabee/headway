//
//  feesDetailViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/26.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class feesDetailViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    var feesType : String?
    //这里应该需要一个后台的接口来获取哪些年份（或者月份？）没有缴费
    let unpayedSections = NSArray(objects: "16","17")
    //这里不知道需不需要后台接口，好像这里就是固定的五项
    let information = NSArray(objects: "缴费单位","缴费户号","户名","抵用券","缴费金额")
    //这里是各项information的详细情况，从后台调用信息，或者自己在APP逻辑内部传参实现
    let detailInfo = NSArray(objects: "华元物业","传参xx","传参xx","传参xx","传参xx")
    @IBOutlet weak var feesDetailTableView: UITableView!
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
//    var sectionName = NSMutableArray()
    //这里的元组存储了缴费时间和事项名称，用来传递参数，但是这里还应该有一个传递的金额，这里没有添加
//    var parameters = (time:"",sectionName:"")
    //这个Button应该连接到支付方式的页面，但是这里因为用作测试先直接跳转到缴费记录的界面
//    @IBAction func payImediatelyButton(_ sender: UIButton) {
//        let currentTime = Date()
//        let dateFomatter = DateFormatter()
//        dateFomatter.dateFormat = "YYYY - MM - dd HH:mm:ss"
//        let time = dateFomatter.string(from: currentTime)
//        parameters = (time,sectionName[0] as! String)
//        self.performSegue(withIdentifier: "showRecordSegue", sender: parameters)
//        
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "showRecordSegue"){
//            let recordController = segue.destination as! paymentRecordViewController
//            recordController.parameterGetter = sender as! (time: String, name: String)
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //这个测试代码居然也会崩溃....= =
        print(feesType!+"??????")
        feesDetailTableView!.delegate = self
        feesDetailTableView!.dataSource = self
        self.feesDetailTableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return unpayedSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        sectionName.add( "\(unpayedSections.object(at: section))"+"\(feesType!)")
//        return "\(sectionName[section])"
        return "\(unpayedSections.object(at: section))"+"\(feesType!)"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        let sectionTitle = UILabel()
//        sectionTitle.text = "\(unpayedSections.object(at: section))"+feesType!
//        headerView.addSubview(sectionTitle)
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
        singleCell.textLabel?.text = "\(information.object(at: indexPath.row))"
        singleCell.detailTextLabel?.text = "\(detailInfo.object(at: indexPath.row))"
        return singleCell
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
