//
//  BaseModel.swift
//  SwiftTest
//
//  Created by 小星星 on 2018/4/28.
//  Copyright © 2018年 L. All rights reserved.
//

import Foundation
struct  BaseApiModel: Codable {
    var count: Int?
    var nextPageUrl: String?
    var total : Double?
    var videoList :[VideoModel]?
    
}
struct  VideoModel: Codable {
    var identifer: Double?
    var idx: Double?
    var title: String?
    var descrip: String?
    var category: String?
    var duration: Double?
    var date: TimeInterval?
    var coverForFeed :String?
    var coverForSharing: String?
    var coverForDetail: String?
    var playUrl: String?
    var coverBlurred: String?
    var webUrl: String?
    var favoriteAdTrack: String?
    var rawWebUrl: String?
    var shareAdTrack: String?
    var waterMarks: String?
    var webAdTrack: String?
    var consumption:VideoModel.Consumption?
    struct Consumption: Codable {
        var collectionCount: Double?
        var playCount: Double?
        var replyCount: Double?
        var shareCount: Double?
    }
    
    var playInfo: [PlayVideoInfo]?
    struct PlayVideoInfo: Codable {
        var height: Float?
        var width: Float?
        var name: String?
        var type: String?
        var url: String?
    }
   
    var provider: VideoModel.Provider?
    struct Provider:Codable {
        var alias: String?
        var icon: String?
        var name: String?
    }
}


struct BannarApiModel: Codable{
    let code: String?
    var data: [BannarModel]?
   
    var rmsg: String?
    
}
struct BannarModel: Codable {
    var image: String?
    var name: String?
    var url: String?
    
}


