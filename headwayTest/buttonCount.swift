//
//  buttonCount.swift
//  headwayTest
//
//  Created by 相科峰 on 2017/9/20.
//  Copyright © 2017年 相科峰. All rights reserved.
//
//这是一个将button按照定时器设置状态的方法，由于封装在这个类中，需要自写一个方法来实现，在实际调用时还是会有一些小问题...有待改进
import Foundation
import UIKit
class buttonCount {
    var remainingSeconds = 0
    var isCounting = false
    func buttonCounter(sendButton : UIButton , time : Int){
        print("被调用")
        var countDownTimer : Timer?
        var remainingSeconds : Int = 0{
            willSet{
                sendButton.setTitle("\(newValue)S后可重发", for: .normal)
                if(newValue<=0){
                    print("remainingSeconds的newValue=\(newValue)")
                    sendButton.setTitle("重发验证码", for: .normal)
                    //这里修改的isCounting的值是在方法外声明的那个，并没有实际修改方法中的isCounting的值，所以就不会调用willSet，也就不会实际执行“三行代码”
                    self.isCounting = false
                    //这里涉及到的问题比较复杂...可以写好多了
                    //为什么下面这三行代码会出现在这里
                    countDownTimer?.invalidate()
                    countDownTimer = nil
                    sendButton.backgroundColor = UIColor.darkGray
                    //原因见上下文，无奈只能在这里加一行很傻的代码来强行改变button状态，有待改进...
                    sendButton.isEnabled = true
                }
            }
        }

        
        var isCounting = false{
            willSet{
                if newValue{
                    print("第一步完成")
                    countDownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
                        (timer) in
                        remainingSeconds -= 1
                    })
                    remainingSeconds = time
                    print("\(remainingSeconds)")
                    sendButton.backgroundColor = UIColor.lightGray
                }else{
                    //这里的三行代码实际上是不会运行的...
                    print("这里运行了吗？")
                    countDownTimer?.invalidate()
                    countDownTimer = nil
                    sendButton.backgroundColor = UIColor.darkGray
                }
                //由于上面说明的原因这行改变button实际状态的代码由于isCounting的值无法被改为false而永远为NO，这显然是不合理的
                sendButton.isEnabled = !newValue
            }
        }
//      sendButton.addTarget(self, action: #selector(self.sendButtonClicked(sender:)), for: .touchUpInside)
        //如果没有这一行代码的话，这个方法就没有意义，因为封装在外置类中，无法使用buttonClicked监听器来修改isCounting的值，只能自己加一行这样的赋值代码，虽然看起来很傻...但是好在有点用
        isCounting = true
    }
//    @objc func updateTime(time : Timer){
//        //计时开始，逐渐减少remainingseconds的值
//        remainingSeconds -= 1
//    }
//    @objc func sendButtonClicked(sender:UIButton){
//        //启动计时
//        print("被调用X2")
//        isCounting = true
//    }
}
