//
//  YXImageCacheManager.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/22.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class YXImageCacheManager: NSObject {

    func readCacheImageData(url:NSString) -> NSData {
        let data:NSData?
        let imagePath:NSString = self.getCachePath(url: url)
        
        if FileManager.default.fileExists(atPath: imagePath as String) {
            
            data = NSData.init(contentsOfFile:imagePath as String)
        }else{
            data = nil
        }
        return data!
        
    }
    class func writeCacheToUrl(url:NSString, data:NSData){
        let path:NSString = YXImageCacheManager().getCachePath(url: url)
        data.write(toFile: path as String, atomically: true)
    }
    
    
    //删除缓存
    class func removeAllCache(){
        
        let cachePath = NSHomeDirectory() + "/Documents/cacheImageFile"
        let fileManage:FileManager = FileManager.default
        if fileManage.fileExists(atPath: cachePath) {
            try! fileManage.removeItem(atPath: cachePath)
        }
    }
    
    func getCachePath(url:NSString) -> NSString {
        let cachePath = NSHomeDirectory() + "/Documents/cacheImageFile"

        let fileManage:FileManager = FileManager.default
        if  !fileManage.fileExists(atPath: cachePath) {
           //图片文件存在
           try! fileManage.createDirectory(atPath: cachePath, withIntermediateDirectories: true, attributes: nil)
        }
        let newUrl = YXImageCacheManager.stringToZYHString(str: url as NSString)
        let imagePath:NSString = cachePath + "/\(newUrl)" as NSString
        
        return imagePath
        
    }
    class func stringToZYHString(str:NSString)->NSString{
        let newStr:NSMutableString=NSMutableString()
    
        for i in 0...str.length-1 {
            let c:unichar = str.character(at: i)
            if (c>=48&&c<=57)||(c>=65&&c<=90)||(c>=97&&c<=122){
                newStr.appendFormat("%c", c)
            }
        }
        return newStr.copy() as! NSString
        
    }
}
