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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personalTableView.delegate = self
        personalTableView.dataSource = self
        personalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseId")
        
        view.addSubview(personalTableView)
        titleArray = [["我的房屋","我的车辆"],["我的订单","我的接单"],["我的缴费","我的报修","我的反馈"]]
        imageArray = [["房屋","车辆"],["订单","接单"],["缴费","报修","反馈"]]
        let personalHeaderView = Bundle.main.loadNibNamed("personalHeaderView", owner: nil, options: [:])?.last as? personalHeaderView
        personalHeaderView?.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width, height: 200))
        personalTableView.tableHeaderView = personalHeaderView
        personalTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        personalTableView.sectionFooterHeight = 0
        
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
    
    func backButtonClicked(){
        self.dismiss(animated: true, completion: nil)
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
