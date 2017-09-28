//
//  paymentRecordViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/27.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class paymentRecordViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    //这里的数据源应该的来自后台吧？不知道需不需要进一步细化做到年+月
    var dateTime = ["2015","2016","2017"]
    let searchType = ["物业费","水费","电费","公共能耗费","维修费","其他"]
    //这个是筛选条件，预计使用didSet{}方法获取它每次设置新值的时候刷新tableView显示内容
    var searchCondition = (dateTime:"",searchType:"")
    //这里是tableView的数据源，这个数据源大概也许应该是来及数据库的吧？并且从数据库查询出来的时候还需要按照时间顺序排序，应该如此
    var parameterGetter = (time:"",name:"")
    var timeSearcher : String = ""{
        didSet{
            self.paymentRecordTableView.reloadData()
        }
    }
    var typeSearcher : String = ""{
        didSet{
            self.paymentRecordTableView.reloadData()
        }
    }
    var testRecord = [(time:"20170101",name:"物业费",sum:"¥666.0"),(time:"20160101",name:"水费",sum:"¥555.0"),(time:"20150101",name:"电费",sum:"¥233.0"),(time:"20170503",name:"其他",sum:"¥66.0"),(time:"20160302",name:"维修费",sum:"¥126.0"),(time:"20150602",name:"公共能耗费",sum:"¥366.0"),(time:"20170707",name:"电费",sum:"¥446.0"),(time:"20171001",name:"水费",sum:"¥63.0"),(time:"20150908",name:"物业费",sum:"¥666.0"),(time:"20150121",name:"其他",sum:"¥43.0"),(time:"20161212",name:"物业费",sum:"¥66.0")]
    @IBOutlet weak var searchLabel: UILabel!
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var paymentRecordTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //下面是时间下拉框有关内容
        let dateDefaultTitle = "请选择年份"
        let dateDropView = TGDropBoxView(parentVC: self, title: dateDefaultTitle, items: dateTime, frame: CGRect(x: searchLabel.frame.maxX+10, y: searchLabel.frame.minY, width: self.view.frame.width/2.6, height: 30))
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        dateDropView.isHightWhenShowList = true
        dateDropView.willShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("will show choices") }
            else { NSLog("will hide choices") }
        }
        dateDropView.didShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("did show choices") }
            else { NSLog("did hide choices") }
        }
        dateDropView.didSelectBoxItemHandler = { (row) in
            NSLog("selected No.\(row): \(dateDropView.currentTitle())")
            self.searchCondition.dateTime = dateDropView.currentTitle()
            self.timeSearcher = dateDropView.currentTitle()
        }
        self.view.addSubview(dateDropView)
        //下面是类型下拉框有关内容
        let typeDefaultTitle = "请选择类型"
        let typeDropView = TGDropBoxView(parentVC: self, title: typeDefaultTitle, items: searchType, frame: CGRect(x: dateDropView.frame.maxX+10, y: dateDropView.frame.minY, width: dateDropView.frame.width, height: dateDropView.frame.height))
        typeDropView.isHightWhenShowList = true
        typeDropView.willShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("will show choices") }
            else { NSLog("will hide choices") }
        }
        typeDropView.didShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("did show choices") }
            else { NSLog("did hide choices") }
        }
        typeDropView.didSelectBoxItemHandler = { (row) in
            NSLog("selected No.\(row): \(dateDropView.currentTitle())")
            self.searchCondition.searchType = typeDropView.currentTitle()
            self.typeSearcher = typeDropView.currentTitle()
        }
        self.view.addSubview(typeDropView)
        
        
        //这里开始是tableView有关内容
        paymentRecordTableView!.delegate = self
        paymentRecordTableView!.dataSource = self
        paymentRecordTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "reuseID1")
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(timeSearcher == "" && typeSearcher == ""){
            return testRecord.count
        }else if(timeSearcher == ""){
            let newDataSource = testRecord.filter{
                $0.name.contains(typeSearcher)
            }
            return newDataSource.count
        }else if(typeSearcher == ""){
            let newDataSource = testRecord.filter{
                $0.time.contains(timeSearcher)
            }
            return newDataSource.count
        }else{
            let newDataSource = testRecord.filter{
                $0.time.contains(timeSearcher)
            }
            let newNewDS = newDataSource.filter{
                $0.name.contains(typeSearcher)
            }
            return newNewDS.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell = UITableViewCell(style: .value1, reuseIdentifier: "reuseID1")
        if(timeSearcher == "" && typeSearcher == ""){
            singleCell.textLabel?.text = testRecord[indexPath.row].time + testRecord[indexPath.row].name
            singleCell.detailTextLabel?.text = testRecord[indexPath.row].sum
        }else if(timeSearcher == ""){
            let newDataSource = testRecord.filter{
                $0.name.contains(typeSearcher)
            }
            singleCell.textLabel?.text = newDataSource[indexPath.row].time + newDataSource[indexPath.row].name
            singleCell.detailTextLabel?.text = newDataSource[indexPath.row].sum
        }else if(typeSearcher == ""){
            let newDataSource = testRecord.filter{
                $0.time.contains(timeSearcher)
            }
            singleCell.textLabel?.text = newDataSource[indexPath.row].time + newDataSource[indexPath.row].name
            singleCell.detailTextLabel?.text = newDataSource[indexPath.row].sum
        }
        else{
            let newDataSource = testRecord.filter{
                $0.time.contains(timeSearcher)
            }
            let newNewDS = newDataSource.filter{
                $0.name.contains(typeSearcher)
            }
            singleCell.textLabel?.text = newNewDS[indexPath.row].time + newNewDS[indexPath.row].name
            singleCell.detailTextLabel?.text = newNewDS[indexPath.row].sum
        }
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
