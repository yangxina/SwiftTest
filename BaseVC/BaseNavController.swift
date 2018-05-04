//
//  BaseNavController.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/22.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.setBackgroundImage(UIImage.init(named: "navBG"), for:.bottom, barMetrics: .default)

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
