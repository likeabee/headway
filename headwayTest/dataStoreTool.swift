//
//  File.swift
//  headwayTest
//
//  Created by 华元信息部_相科峰 on 2017/9/29.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import Foundation
class dataStoreTool{
    /*  使用NSUserDefaults对普通数据对象储存   */
    
    /**
     储存
     
     - parameter key:   key
     - parameter value: value
     */
    func setNormalDefault(key:String, value:String?){
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        }
        else{
            UserDefaults.standard.set(value, forKey: key)
            // 同步
            UserDefaults.standard.synchronize()
        }
    }
    
    /**
     通过对应的key移除储存
     
     - parameter key: 对应key
     */
    func removeNormalUserDefault(key:String?){
        if key != nil {
            UserDefaults.standard.removeObject(forKey: key!)
            UserDefaults.standard.synchronize()
        }
    }
    //判断是否已经设置
    func dataIsSet(key:String?) -> Bool{
        if(key != nil){
            return true
        }else{
            return false
        }
        
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    /**
     通过key找到储存的value
     
     - parameter key: key
     
     - returns: AnyObject
     */
    func getNormalDefult(key:String)->String?{
        return UserDefaults.standard.string(forKey:key)
    }
}
