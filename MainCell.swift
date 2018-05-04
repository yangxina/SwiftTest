//
//  MainCell.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/21.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit
import Kingfisher
class MainCell: UITableViewCell {
    var  dataModel:NSDictionary!
    
    @IBOutlet var headerImg: UIImageView!
    @IBOutlet var nameLab: UILabel!
    @IBOutlet var detaiLab: UILabel!
    @IBOutlet var addBtn: NSLayoutConstraint!
    @IBOutlet var addBtnNN: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setValueForCell(dataModel:VideoModel) -> () {
//        headerImg.sd_setImage(with: NSURL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502367139&di=2ff6ffaa08b7299102ec84c8c8616c9d&imgtype=jpg&er=1&src=http%3A%2F%2Fimg9.zol.com.cn%2Fpic%2Fyouxi%2F800_36%2F366903.jpg" ) as! URL, placeholderImage: UIImage.init(named: "123"))
//        headerImg.setImageWith(NSURL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502367139&di=2ff6ffaa08b7299102ec84c8c8616c9d&imgtype=jpg&er=1&src=http%3A%2F%2Fimg9.zol.com.cn%2Fpic%2Fyouxi%2F800_36%2F366903.jpg" ) as! URL, placeholder: UIImage.init(named: "123"))
//        let imageUrl = datadic.value(forKey: "image") as! String
//        let server = "http://www.songdongqc.com:8092/resource"
//        let url = URL.init(string:  server + imageUrl)
        
        let imageUrl = URL.init(string: dataModel.coverForFeed!)
        
//      KingfisherManager.shared.cache.clearMemoryCache()
//        KingfisherManager.shared.cache.clearDiskCache()
        headerImg.kf.setImage(with: imageUrl,
                    placeholder: nil,
                    options: [.transition(ImageTransition.fade(1))],
                    progressBlock: { receivedSize, totalSize in
                        print("\(1): \(receivedSize)/\(totalSize)")
        },
                    completionHandler: { image, error, cacheType, imageURL in
                        print("\(1): Finished ：\(String(describing: imageURL))")
        })
        self.nameLab.text = dataModel.title
        self.detaiLab.text = dataModel.descrip
//        self.nameLab.text = datadic.value(forKey: "name") as? String
//        self.detaiLab.text = datadic.value(forKey: "url") as? String
    }
    func setValueForbanner(dataModel:BannarModel) -> () {
        let imageBack = dataModel.image!
        let imageFront = "http://www.songdongqc.com:8092/resource"
        let imageUrl = URL.init(string: imageFront.appending(dataModel.image as! String))
        headerImg.kf.setImage(with: imageUrl, placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: { (receivedSize, totalSize) in
            
        }) { (image, error, cacheType, imageUrl) in
            
        }
        self.nameLab.text = dataModel.name
        self.detaiLab.text = dataModel.url
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
