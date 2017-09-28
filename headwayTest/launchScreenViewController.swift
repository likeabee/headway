//
//  launchScreenViewController.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/19.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import UIKit

class launchScreenViewController: UIViewController {
    //这是背景图片，动画载体
    @IBOutlet weak var BGIMAGE: UIImageView!
    //这是跳转按钮
    @IBAction func switchButton(_ sender: UIButton) {
        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        let navController = mainSB.instantiateViewController(withIdentifier: "firstNavVCid")
        self.present(navController, animated: true, completion: nil)
    }
    //这是文字动画容器
    @IBOutlet weak var animateContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftFont = CTFontCreateWithName("AvenirNext-UltraLight" as CFString?, 50, nil)
        performStrokeAnimation(text: "HEADWAY", font: swiftFont, inView: animateContainer)
        UIView.animate(withDuration: 1.5, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.BGIMAGE.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 2, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
//            self.BGIMAGE.transform = CGAffineTransform(scaleX: 1.1 , y: 1.1)
//        }, completion: nil)
        print("这里被运行了吗？")
        UIView.animate(withDuration: 1.5, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.BGIMAGE.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: nil)
    }
    override var prefersStatusBarHidden: Bool{
        return true
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
