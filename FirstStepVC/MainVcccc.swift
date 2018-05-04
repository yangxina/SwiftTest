//
//  MainVcccc.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/15.
//  Copyright © 2018年 L. All rights reserved.
//

import Alamofire
import Kingfisher
import MBProgressHUD
import UIKit
import FSPagerView
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
class MainVcccc: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        tabbleV.setEditing(true, animated: true)
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let row :UITableViewRowAction = UITableViewRowAction.init(style:.default, title: "delete") { (rowACTION:UITableViewRowAction, indexPath) in
            print("deleted")
           
        }
        let row1:UITableViewRowAction = UITableViewRowAction.init(style: .default, title: "like") { (action1, indexPath) in
            print("like")
        }
        row.backgroundColor = UIColor.red
        row1.backgroundColor = UIColor.green
       
        
        return [row,row1]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextvc:MeCityVC = MeCityVC()
       
        nextvc.title = "second"
          TProgressHUD.show()
       
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            TProgressHUD.hide()
            TAlert.show(type: .info, text: "请在iPhone的“设置－隐私")
             self.navigationController?.pushViewController(nextvc, animated:true)
        }
        DispatchQueue.global().async {
            
        }
       
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var  rowHeight: CGFloat?
        
            rowHeight = 100
        
       

        
        return rowHeight!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if baseApiModel != nil {
//            return (baseApiModel?.videoList?.count)!
//        }else{
//            return 0
//        }
        if bannarApiModel != nil {
            return (bannarApiModel?.data?.count)!
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuserIdentifer = "maincell"
       
        var cell: MainCell
        
        let temp: AnyObject? = tableView.dequeueReusableCell(withIdentifier: reuserIdentifer)
        
        if (temp as? MainCell) == nil {
            
           // cell = MainCell(style: UITableViewCellStyle.default, reuseIdentifier: reuserIdentifer)
            cell = Bundle .main.loadNibNamed("MainCell", owner: nil, options: nil)?.first as!MainCell
        }else{
            cell = temp as! MainCell
        }
        
//        let vmodel: VideoModel = (baseApiModel?.videoList![indexPath.row])!
//        if baseApiModel != nil {
//            cell.setValueForCell(dataModel: vmodel)
//        }
        
        let bannarM = bannarApiModel?.data![indexPath.row]
        if bannarApiModel != nil {
            cell.setValueForbanner(dataModel: bannarM!)
        }
        
        
        
        


     //   print(cell.nameLab.text as! String)
        
        return cell;
    }
    
    
    var tabbleV:UITableView!
    var cycleScroll:SDCycleScrollView!
    var pagerView : FSPagerView!
    var pagerProtocal: PagerProtocal?
    var pagerControl: FSPageControl!
    
    var baseApiModel: BaseApiModel?
    var bannarApiModel: BannarApiModel?
    var dataArray: NSArray?
    
    func loadFakeData(){
        
       
       
        let jsonPath = Bundle.main.path(forResource: "videoData", ofType: "json")
        let data = NSData.init(contentsOfFile: (jsonPath)!)
        let dictionary:NSDictionary = self.dataToDictionary(data: data! as Data)! as NSDictionary
        
       // print("dataDic = \(dictionary)")
        let decoder = JSONDecoder()    //解析JSON数据
        let baseModel = try! decoder.decode(BaseApiModel.self, from: data as! Data )
        baseApiModel = baseModel
        
        if baseApiModel != nil {
           // TProgressHUD.hide()
            
        }
       
    }
    
    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{
    do{
    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        let dic = json as!Dictionary<String, Any>
    return dic
    } catch _ {
    print("失败")
    return nil
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.loadFakeData()
        self.loadData()
        self.loadUI();
        
        if #available(iOS 11.0, *) {
            tabbleV.contentInsetAdjustmentBehavior = .never;
        }else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //TAlert.show(type: .success, text: "1232434")
       
        //MBProgressHUD.showAdded(to: self.view, animated: true)
      
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
              KingfisherManager.shared.cache.clearMemoryCache()
                KingfisherManager.shared.cache.clearDiskCache()
    }
      
        
    
    
   
    func loadData (){
       
       
       let parameters: Parameters = ["status":"4","zip":"","typeId":""]
       
          Alamofire.request("http://www.songdongqc.com:8092/json/business/BusinessAdvertorialBanner", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                print("response = \(response)")
                let decoder = JSONDecoder()
                let bannarMode = try! decoder.decode(BannarApiModel.self, from: response.data!)
                self.bannarApiModel = bannarMode
                
                self.pagerProtocal?.imageSource = bannarMode.data! as NSArray
                self.pagerControl.numberOfPages = (self.pagerProtocal!.imageSource.count)
                self.pagerView.reloadData()
                    
                self.tabbleV.reloadData()
               
                
               
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    func loadUI(){
        tabbleV =  UITableView(frame:CGRect.init(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height), style: UITableViewStyle.plain)
        tabbleV.delegate = self
        tabbleV.dataSource = self
        self.view.addSubview(tabbleV);
        
        
      
        tabbleV.mas_makeConstraints { (make:MASConstraintMaker!) in
            Top_Mas(mas_view: self.view, offSet: 0, make:make)
            Left_Mas(mas_view: self.view, offSet: 0, make: make)
            Right_Mas(mas_view: self.view, offSet: 0, make: make)
            Bottom_Mas(mas_view: self.view, offSet:49, make: make)
           
            }
   
        let tableHeader:UIView  = self.createTableHeader()
        tabbleV.tableHeaderView = tableHeader
        
        
        
    }
    func createTableHeader() -> UIView {
        let headerV = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth*9/16))
        headerV.backgroundColor = UIColor.white
        pagerProtocal = PagerProtocal()
        
        pagerControl = FSPageControl.init(frame:CGRect.init(x: 0, y: 0, width: kScreenWidth, height:  kScreenWidth*9/16) )
       
        pagerControl.contentHorizontalAlignment = .center
        
        pagerProtocal?.pageC = pagerControl
        
        pagerView = FSPagerView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height:  kScreenWidth*9/16))
        pagerView.itemSize = CGSize(width:kScreenWidth - 20,height:kScreenWidth*9/16 - 10)
        pagerView.automaticSlidingInterval = 3.0
        pagerView.isInfinite = true
//        objc_setAssociatedObject(pagerProtocal, "pagerControl", pagerControl, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        pagerView.delegate = pagerProtocal
        pagerView.dataSource = pagerProtocal
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "pagerCell")
        pagerView.transformer = FSPagerViewTransformer.init(type: .cubic) //转场样式
      
        
     
        

        headerV.addSubview(pagerView)
        headerV.addSubview(pagerControl)
        pagerView.mas_makeConstraints { (make:MASConstraintMaker!) in
            Top_Mas(mas_view: headerV, offSet: 0, make: make)
            Left_Mas(mas_view: headerV, offSet: 0, make: make)
            Right_Mas(mas_view: headerV, offSet: 0, make: make)
            Bottom_Mas(mas_view: headerV, offSet: 0, make: make)
        }
        pagerControl.mas_makeConstraints { (make:MASConstraintMaker!) in
            Left_Mas(mas_view: headerV, offSet: 0, make: make)
            Right_Mas(mas_view: headerV, offSet: 0, make: make)
            Bottom_Mas(mas_view: headerV, offSet: 0, make: make)
            Height_Mas(offSet: 30, make: make)
        }
        return headerV
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

