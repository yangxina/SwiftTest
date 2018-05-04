//
//  BaseTabbarVC.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/22.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class BaseTabbarVC: UITabBarController {

    init(imageArray:NSArray){
        
        super.init(nibName: nil, bundle: nil)
         self .createControllers(imageArray: imageArray)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createControllers(imageArray:NSArray) {
        let mainc = MainVcccc();
        mainc.view.backgroundColor = UIColor.white
        mainc.tabBarItem?.title = "首页"
        mainc.tabBarItem.selectedImage = UIImage.init(named: "图层-1")
        mainc.tabBarItem.image =  UIImage.init(named: "图层-1")
        mainc.tabBarController?.tabBar.barTintColor = UIColor.red
        let mainNav:BaseNavController = BaseNavController.init(rootViewController: mainc)
        
        let nextVC  = NextVc()
        nextVC.view.backgroundColor = UIColor.white
        nextVC.tabBarItem?.title = "副业"
        nextVC.tabBarItem.selectedImage = UIImage.init(named: "商圈构成_s")
        nextVC.tabBarItem.image =  UIImage.init(named: "商圈构成")
        nextVC.tabBarController?.tabBar.barTintColor = UIColor.green
        let mainNav1:BaseNavController = BaseNavController.init(rootViewController: nextVC)
        
        let msgVc = MsgVc()
        msgVc.view.backgroundColor = UIColor.white
        msgVc.tabBarItem?.title = "消息"
        msgVc.tabBarItem.selectedImage = UIImage.init(named: "我的-(5)")
        msgVc.tabBarItem.image =  UIImage.init(named: "我的-(5)")
        
        //  msgVc.tabBarItem.
        
        let mainNav2:BaseNavController = BaseNavController.init(rootViewController: msgVc);
        
        self.setViewControllers([mainNav ,mainNav1,mainNav2], animated: true)
        self.tabBar.tintColor = UIColor.purple
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor.darkGray
        } else {
            // Fallback on earlier versions
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if self.tabBar.frame.size.height == 83{
//            var tabbarFram = self.tabBar.frame
//            tabbarFram.size.height = 59
//            self.tabBar.frame = tabbarFram
//            self.tabBar.barStyle = .default
//            
//        }
//    }
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
