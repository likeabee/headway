//
//  homePageViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/25.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class homePageViewController: UIViewController , SliderGalleryControllerDelegate{
    //获取屏幕的宽度和高度，以便自己创建控件
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    //这是图片轮播的控件
    var sliderGallery : SliderGalleryController!
    //这是来自网络的图片...需要加载...回头可以自己写一个利用包中图片资源的，虽然这样APP文件可能会比较大...
    var images = ["https://a3.qpic.cn/psb?/V14EP5pY26n007/fCO1oamKhp.LOO9T6GiZlJJos0T6of.Sm1KYyCsZAWU!/m/dD4BAAAAAAAAnull&bo=.gB6AAAAAAARB7A!&rf=photolist&t=5",
                  "https://a2.qpic.cn/psb?/V14EP5pY26n007/usenuSeOONw4njfirt*xvQMXlxUi0g4knSX1TPgUmkk!/b/dD8BAAAAAAAA&bo=.gB6AAAAAAARALc!&rf=viewer_4",
                  "https://a3.qpic.cn/psb?/V14EP5pY26n007/NK2*NDXXYy.VVSE03oAqJYP46V3svMk1HtGPzkfl*tw!/m/dPIAAAAAAAAAnull&bo=.gB6AAAAAAARB7A!&rf=photolist&t=5",
                  "https://a4.qpic.cn/psb?/V14EP5pY26n007/0g54y4Vz*uj*RXsJiTB3qq9JVJK5rHRQR5nC7qFMIas!/m/dD8BAAAAAAAAnull&bo=.gB6AAAAAAARB7A!&rf=photolist&t=5",
                  "https://a3.qpic.cn/psb?/V14EP5pY26n007/fCO1oamKhp.LOO9T6GiZlJJos0T6of.Sm1KYyCsZAWU!/m/dD4BAAAAAAAAnull&bo=.gB6AAAAAAARB7A!&rf=photolist&t=5"]
    //费用缴纳button
    @IBOutlet weak var feesPaymentButton: UIButton!
    //社区商城button
    @IBOutlet weak var mallButton: UIButton!
    //园区通行button
    @IBOutlet weak var passmentButton: UIButton!
    //投诉表扬button
    @IBOutlet weak var judgementButton: UIButton!
    //报修服务button
    @IBOutlet weak var repairButton: UIButton!
    //社区交流button
    @IBOutlet weak var communicationButton: UIButton!
    //个人中心button
    @IBOutlet weak var personalButton: UIButton!
    //你知道吗button
    @IBOutlet weak var kownmentButton: UIButton!
    
    @IBAction func backBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //轮播控件初始化
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 60, width: screenWidth, height: screenHeight/5)
        
        //将轮播控件加入到当前视图中
        self.addChildViewController(sliderGallery)
        self.view.addSubview(sliderGallery.view)
        
        //添加一个点击事件，这里的点击事件还没有具体说明需要怎么样，现在先做成了点击弹窗的样子
        let tapEvent = UITapGestureRecognizer(target:self , action: #selector(self.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tapEvent)
        // Do any additional setup after loading the view.
        
        //这里是瀑布流button控件
        //这里的注释很晃眼...但是为了告诫自己注释中的方法是不可行的，还是留着吧...
        feesPaymentButton.frame = CGRect(x: 20, y: sliderGallery.view.frame.maxY+10, width: screenWidth/2-25, height: screenHeight/4)
//        feesPaymentButton = UIButton(frame: CGRect(x: screenWidth/2-5-feesPaymentButton.frame.width, y: sliderGallery.view.frame.maxY+10, width: screenWidth/2-25, height: screenWidth/4))
        mallButton.frame = CGRect(x: screenWidth/2+5, y: sliderGallery.view.frame.maxY+10, width: screenWidth/2-25, height: screenHeight/4-40)
//        mallButton = UIButton(frame: CGRect(x: screenWidth/2+5, y: sliderGallery.view.frame.maxY+10, width: screenWidth/2-25, height: screenHeight/4-20))
        passmentButton.frame = CGRect(x: feesPaymentButton.frame.minX, y: feesPaymentButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: feesPaymentButton.frame.height-60)
//        passmentButton = UIButton(frame: CGRect(x: feesPaymentButton.frame.minX, y: feesPaymentButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: feesPaymentButton.frame.height-30))
        judgementButton.frame = CGRect(x: mallButton.frame.minX, y: mallButton.frame.maxY+10, width: mallButton.frame.width, height: mallButton.frame.height)
//        judgementButton = UIButton(frame: CGRect(x: mallButton.frame.minX, y: mallButton.frame.maxY+10, width: mallButton.frame.width, height: mallButton.frame.height))
        repairButton.frame = CGRect(x: passmentButton.frame.minX, y: passmentButton.frame.maxY+10, width: passmentButton.frame.width, height: passmentButton.frame.height)
//        repairButton = UIButton(frame: CGRect(x: passmentButton.frame.minX, y: passmentButton.frame.maxY+10, width: passmentButton.frame.width, height: passmentButton.frame.height))
        communicationButton.frame = CGRect(x: judgementButton.frame.minX, y: judgementButton.frame.maxY+10, width: judgementButton.frame.width, height: judgementButton.frame.height)
//        communicationButton = UIButton(frame: CGRect(x: judgementButton.frame.minX, y: judgementButton.frame.maxY+10, width: judgementButton.frame.width, height: judgementButton.frame.height))
        personalButton.frame = CGRect(x: repairButton.frame.minX, y: repairButton.frame.maxY+10, width: repairButton.frame.width, height: screenHeight/16)
//        personalButton = UIButton(frame: CGRect(x: repairButton.frame.minX, y: repairButton.frame.maxY+10, width: repairButton.frame.width, height: screenHeight/16))
        kownmentButton.frame = CGRect(x: communicationButton.frame.minX, y: communicationButton.frame.maxY+10, width: communicationButton.frame.width, height: screenHeight/16)
//        kownmentButton = UIButton(frame: CGRect(x: communicationButton.frame.minX, y: communicationButton.frame.maxY+10, width: communicationButton.frame.width, height: screenHeight/16))
        
        //最终由于屏幕适配问题还是放弃了纯代码控制控件的方式...还是用autolayout+代码布局把
//        //费用缴纳button
//        let feesPaymentButton = UIButton(frame: CGRect(x: sliderGallery.view.frame.minX+20, y: sliderGallery.view.frame.maxY+10, width: screenWidth/2-25, height: screenHeight/4))
//        feesPaymentButton.setTitle("费用缴纳", for: .normal)
//        feesPaymentButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(feesPaymentButton)
//        //社区商城button
//        let mallButton = UIButton(frame: CGRect(x: feesPaymentButton.frame.maxX+10, y: feesPaymentButton.frame.minY, width: feesPaymentButton.frame.width, height: screenHeight/5-10))
//        mallButton.setTitle("社区商城", for: .normal)
//        mallButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(mallButton)
//        //园区通行button
//        let passButton = UIButton(frame: CGRect(x: feesPaymentButton.frame.minX, y: feesPaymentButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/7))
//        passButton.setTitle("园区通行", for: .normal)
//        passButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(passButton)
//        //投诉表扬button
//        let judgementButton = UIButton(frame: CGRect(x: mallButton.frame.minX, y: mallButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/5-10))
//        judgementButton.setTitle("投诉表扬", for: .normal)
//        judgementButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(judgementButton)
//        //报修服务button
//        let repairButton = UIButton(frame: CGRect(x: passButton.frame.minX, y: passButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/7))
//        repairButton.setTitle("报修服务", for: .normal)
//        repairButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(repairButton)
//        //社区交流button
//        let communicationButton = UIButton(frame: CGRect(x: judgementButton.frame.minX, y: judgementButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/6-1))
//        communicationButton.setTitle("社区交流", for: .normal)
//        communicationButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(communicationButton)
//        //个人中心button
//        let personalButton = UIButton(frame: CGRect(x: repairButton.frame.minX, y: repairButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/11))
//        personalButton.setTitle("个人中心", for: .normal)
//        personalButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(personalButton)
//        //你知道吗button
//        let kownMentButton = UIButton(frame: CGRect(x: communicationButton.frame.minX, y: communicationButton.frame.maxY+10, width: feesPaymentButton.frame.width, height: screenHeight/11))
//        kownMentButton.setTitle("你知道吗", for: .normal)
//        kownMentButton.backgroundColor = UIColor.lightGray
//        self.view.addSubview(kownMentButton)
//        
//        //这里需要添加一些button点击事件......等待写（所有功能模块的界面做完以后）....
//        
//
//        //这个是返回按钮...返回按钮没有显示...改改改...难受
//        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.leftBarButtonClicked))
//        navBar.backItem?.backBarButtonItem = leftBarButton
    }

    func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        sliderGallery.reloadData()
    }
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth, height: screenHeight/5)
    }
    
    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return images
    }

    //这里不知道是不是应该有个刷新的按钮或者设置下拉刷新的操作，用来reload数据
    
    
    //返回按钮
    func leftBarButtonClicked(){
        dismiss(animated: true, completion: nil)
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
