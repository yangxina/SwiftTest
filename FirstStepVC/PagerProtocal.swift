//
//  PagerProtocal.swift
//  SwiftTest
//
//  Created by 小星星 on 2018/5/2.
//  Copyright © 2018年 L. All rights reserved.
//

import Foundation
import Kingfisher
import FSPagerView

class PagerProtocal: NSObject,FSPagerViewDataSource,FSPagerViewDelegate{
    var imageSource: NSArray!
    var viewController: UIViewController?
    var pageC: FSPageControl!
    
    
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let pagerCell = pagerView.dequeueReusableCell(withReuseIdentifier: "pagerCell", at: index)
         let server = "http://www.songdongqc.com:8092/resource"
        let imageUrl = URL.init(string:server.appending(imageSource[index] as! String) )
        pagerCell.imageView?.kf.setImage(with: imageUrl)
        return pagerCell
    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return (imageSource?.count)!
        
    }
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
//        let pageControl:FSPageControl =    objc_getAssociatedObject(self, "pagerControl") as! FSPageControl
        
       
        guard pageC.currentPage != pagerView.currentIndex else {
            return
        }
        pageC.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    
    
    
}
