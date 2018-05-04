//
//  YXSwiftDefine.swift
//  SwiftTest
//
//  Created by yangxin on 2018/3/23.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit
import Alamofire



let k_SCREEN_SIZE =  UIScreen.main.bounds.size

func Left_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.left.mas_equalTo()(mas_view.mas_left)!.setOffset(offSet)
}
func Right_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.right.mas_equalTo()(mas_view.mas_right)!.setOffset(-offSet)
}
func  Top_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.top.mas_equalTo()(mas_view.mas_top)!.setOffset(offSet)
}
func Bottom_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.bottom.mas_equalTo()(mas_view.mas_bottom)!.setOffset(-offSet)
}
func CenterY_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.centerY.mas_equalTo()(mas_view.center.y)!.setOffset(offSet)
}
func CenterX_Mas(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.centerX.mas_equalTo()(mas_view.center.x)!.setOffset(offSet)
}

func Left_Mas_ViewRight(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.left.mas_equalTo()(mas_view.mas_right)!.setOffset(offSet)
}
func Right_Mas_ViewLeft(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.right.mas_equalTo()(mas_view.mas_left)!.setOffset(offSet)
}
func Bottom_Mas_ViewTop(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.bottom.mas_equalTo()(mas_view.mas_top)!.setOffset(-offSet)
}
func Top_Mas_ViewBottom(mas_view:UIView, offSet:CGFloat,make:MASConstraintMaker){
    return  make.top.mas_equalTo()(mas_view.mas_bottom)!.setOffset(offSet)
}

func Width_Mas(offSet:CGFloat,make:MASConstraintMaker){
    return make.width.setOffset(offSet)
}
func Height_Mas(offSet:CGFloat,make:MASConstraintMaker){
    return make.height.setOffset(offSet)
}



//func  Top_Left_Bottom_Right_Mas(mas_view:UIView,make:MASConstraintMaker){
//    return Top_Mas(mas_view: mas_view, offSet: 0, make: make)
//           Left_Mas(mas_view: mas_view, offSet: 0, make: make)
//           Right_Mas(mas_view: mas_view, offSet: 0, make: make)
//           Bottom_Mas(mas_view: mas_view, offSet: 0, make: make)
//}

