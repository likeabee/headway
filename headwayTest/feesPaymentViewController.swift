//
//  feesPaymentViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/26.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class feesPaymentViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    let feesTypes = NSArray(objects: "物业费","水费","电费","公共能耗费","维修费","其他")
    let images : [String] = ["物业费","水费","电费","小区","维修","其他"]
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //缴费记录的barButtonItem，点击事件，跳转到缴费记录页面，这里可以使用segue跳转
    @IBAction func paymentRecordBarButtonItem(_ sender: UIBarButtonItem) {
    }
    
    //显示内容的tableView
    @IBOutlet weak var feesTypeTableView: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置代理和数据源
        feesTypeTableView!.delegate = self
        feesTypeTableView!.dataSource = self
        //创建重用单元格，以reuseIdentifier设置重用
        feesTypeTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "reuseId")
        self.feesTypeTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        // Do any additional setup after loading the view.
    }
    //这里应该只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //返回一个分区有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feesTypes.count
    }
    //各单元显示内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell = UITableViewCell(style: .default, reuseIdentifier: "reuseId")
        singleCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        singleCell.imageView?.image = UIImage(named: images[indexPath.row])
        print(images[indexPath.row])
        singleCell.textLabel?.text = "\(feesTypes.object(at: indexPath.row))"
        return singleCell
    }
    //delegate中的方法,处理tableView中cell被选中时的事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feesTypeTableView.deselectRow(at: indexPath, animated: true)
        let feesType = "\(feesTypes.object(at: indexPath.row))"
        self.performSegue(withIdentifier: "showDetailSegue", sender: feesType)
        //调试到这里还是正常的...
        print(feesType+"???")
    }
    //在这个方法中传递 给新页面的 参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetailSegue"){
            let detailController = segue.destination as! feesDetailViewController
            detailController.feesType = sender as? String
            print("传递的参数的值为 "+detailController.feesType!)
        }
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
