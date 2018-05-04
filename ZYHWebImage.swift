//
//  ZYHWebImage.swift
//  SwiftMovie
//
//  Created by apple on 15-6-24.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    /**
    *设置web图片
    *url:图片路径
    *defaultImage:默认缺省图片
    *isCache：是否进行缓存的读取
    */
  
    
    
    func yx_setImage(url:NSString?,pleaceHodelerImage:NSString?,isCache:Bool) {
        var yxImage:UIImage?
        if url == nil {
            return
        }
        //设置默认图片
        if pleaceHodelerImage != nil {
            self.image = UIImage.init(named:pleaceHodelerImage! as String)
            
        }
        if isCache {
            var cacheData:NSData = YXImageCacheManager().readCacheImageData(url: url!)
            if cacheData != nil {
                yxImage = UIImage.init(data: cacheData as Data)
                self.image = yxImage
            }else{
                var queue = DispatchQueue.global()
                DispatchQueue.global().async {
                    let URL:NSURL = NSURL.init(string: url! as String)!
                    let data:NSData = NSData.init(contentsOf: URL as URL)!
                    if data != nil {
                        yxImage = UIImage.init(data: data as Data)
                        //写缓存
                        YXImageCacheManager.writeCacheToUrl(url: url!, data: data)
                     
                        DispatchQueue.main.async {
                            //刷新主UI
                            self.image = yxImage
                        }
                    }
                }
            }
        }else{
            var queue = DispatchQueue.global()
            DispatchQueue.global().async {
                let URL:NSURL = NSURL.init(string: url! as String)!
                let data:NSData = NSData.init(contentsOf: URL as URL)!
                if data != nil {
                    yxImage = UIImage.init(data: data as Data)
                    //写缓存
                    YXImageCacheManager.writeCacheToUrl(url: url!, data: data)
                    
                    DispatchQueue.main.async {
                        //刷新主UI
                        self.image = yxImage
                    }
                }
            }
        }
    }
    
}


