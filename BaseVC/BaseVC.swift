//
//  BaseVC.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/22.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class BaseVC: UIViewController,UIGestureRecognizerDelegate {

    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
       
        if #available(iOS 11.0, *) {
            
           
            
        } else {
            
            //低于 iOS 11.0
            self.automaticallyAdjustsScrollViewInsets = false
            
        }
        
        
        let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self,
                                         action: #selector(backToPrevious))
        leftBarBtn.image = UIImage(named: "返回按键")
        leftBarBtn.tintColor = UIColor.purple

        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -10
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        
        
        let target = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let pan = UIPanGestureRecognizer(target:target,
                                         action:Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        //同时禁用系统原先的侧滑返回功能
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
        
    }
    @objc func backToPrevious() {
        self.navigationController?.popViewController(animated: true)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
        UIGestureRecognizer) -> Bool {
        if self.childViewControllers.count == 1 {
            return false
        }
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
