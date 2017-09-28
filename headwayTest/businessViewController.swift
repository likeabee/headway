//
//  businessViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/21.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class businessViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let normalDefaultImage = UIImage(named: "normal_default")
    let normalSelectedImage = UIImage(named: "normal_selected")
    let ownerDefaultImage = UIImage(named: "owner_default")
    let ownerSelectedImage = UIImage(named: "owner_selected")
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var ownerButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var normalContainer: UIView!
    @IBOutlet weak var ownerContainer: UIView!
    @IBAction func normalButton(_ sender: UIButton) {
        if(normalButton.backgroundImage(for: UIControlState.normal) == normalSelectedImage){
            print("owner一直是被选中状态")
        }else{
            normalButton.setBackgroundImage(normalSelectedImage, for: UIControlState.normal)
            print("normal刚刚是未选中，现在选中了")
            ownerButton.setBackgroundImage(ownerDefaultImage, for: UIControlState.normal)
            self.view.addSubview(normalContainer)
        }
    }
    @IBAction func ownerButton(_ sender: UIButton) {
        if(ownerButton.backgroundImage(for: UIControlState.normal) == ownerSelectedImage){
            print("owner一直是被选中状态")
        }else{
            ownerButton.setBackgroundImage(ownerSelectedImage, for: UIControlState.normal)
            normalButton.setBackgroundImage(normalDefaultImage, for: UIControlState.normal)
            print("刚刚未被选中")
            self.view.addSubview(ownerContainer)
        }
    }
    
    
//    func selectorSourceType(type: UIImagePickerControllerSourceType) {
//        imagePickerController.sourceType = type
//        // 打开图片选择器
//        present(self.imagePickerController, animated: true, completion: nil)
//    }
    
    
    
    //分割线//
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var verificationCodeTextField: UITextField!
    @IBOutlet weak var businessTextField: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBAction func verifyButton(_ sender: UIButton) {
        if(phoneNumberTextField.text == "" || phoneNumberTextField.text?.characters.count != 11){
            let warnAlert = UIAlertController(title: "提示", message: "请输入正确手机号", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "知道了", style: .cancel, handler: nil)
            warnAlert.addAction(cancelAction)
            self.present(warnAlert, animated: true, completion: nil)
        }else{
            print("输入格式正确")
            buttonCount().buttonCounter(sendButton: verifyButton, time: 10)
        }
        
    }
    @IBAction func uploadButton(_ sender: UIButton) {
        //这里添加上传营业执照代码，具体操作应该是获取本地图片库中的图片，然后显示缩略图...具体实现...
        //发现这功能也可以写成接口
        let selectorAlertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        selectorAlertVC.addAction(UIAlertAction(title: "拍照选择", style: .default, handler: {
            (action:UIAlertAction)->Void in
            self.openCamera()
        }))
        selectorAlertVC.addAction(UIAlertAction(title: "相册选择", style: .default, handler: {
            (action:UIAlertAction)->Void in
            self.openAlbum()
        }))
        selectorAlertVC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        self.present(selectorAlertVC, animated: true, completion: nil)
    }
    @IBAction func postButton(_ sender: UIButton) {
        //这里添加提交代码和相应跳转操作，注意验证信息
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addSubview(normalContainer)
        verifyButton.layer.cornerRadius = 5
        postButton.layer.cornerRadius = 15
        //uploadButton.layer.cornerRadius = 15
        //分割线
        
        normalButton.frame = CGRect(x: self.normalContainer.frame.origin.x-16, y: self.normalContainer.frame.origin.y-30, width: self.normalContainer.frame.width/2+16, height: 30)
        ownerButton.frame = CGRect(x: self.normalButton.frame.origin.x + self.normalButton.frame.width, y: self.ownerContainer.frame.origin.y-30, width: self.normalButton.frame.width, height: 30)
        normalButton.setBackgroundImage(normalSelectedImage, for: UIControlState.normal)
        ownerButton.setBackgroundImage(ownerDefaultImage, for: UIControlState.normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
        verificationCodeTextField.resignFirstResponder()
        businessTextField.resignFirstResponder()
    }

        
        //图片选择器界面
//        var imagePickerController: UIImagePickerController {
//            get {
//                let imagePicket = UIImagePickerController()
//                imagePicket.delegate = self
//                imagePicket.sourceType = .photoLibrary
//                return imagePicket
//            }
//        }
    
//        //当图片选择器选择了一张图片之后回调
//        @nonobjc func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
//            dismiss(animated: true, completion: nil) // 选中图片, 关闭选择器...这里你也可以 picker.dismissViewControllerAnimated 这样调用...但是效果都是一样的...
//            
//            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage // 显示图片
//            imageView.contentMode = .scaleToFill // 缩放显示, 便于查看全部的图片
//        }
    
        //当点击图片选择器中的取消按钮时回调
        @nonobjc func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil) // 效果一样的...
        }
//    var cameraController : UIImagePickerController{
//        get{
//            let imagepicker = UIImagePickerController()
//            imagepicker.delegate = self
//            imagepicker.sourceType = .camera
//            return imagepicker
//        }
//    }
    
    //打开相册
    func openAlbum(){
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //设置是否允许编辑
            //            picker.allowsEditing = editSwitch.on
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    
    //打开相机
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.camera
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            self.present(picker, animated: true, completion: { () -> Void in
                
            })
        }else{
            debugPrint("找不到相机")
        }
    }
    //选择图片成功后代理
    @nonobjc func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //查看info对象
        print(info)
        //获取选择的原图
        let image : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        NSLog("", image)
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
//            self.imageView.image = image
        })
        delay(1, task: {
            self.imageView.image = image
        })
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
