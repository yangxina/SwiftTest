//
//  GNDefine.h
//  MarketEleven
//
//  Created by Bergren Lam on 8/6/14.
//  Copyright (c) 2014 Meinekechina. All rights reserved.
//

#ifndef GN_DEFINE_H
#define GN_DEFINE_H

//屏幕适配
#define Universal_Height(h) \
  ([[UIScreen mainScreen] bounds].size.height / 667 * h)
#define Universal_Width(w) ([[UIScreen mainScreen] bounds].size.width / 667 * w)
#define Universal_Size(size) \
  CGSizeMake(Universal_Width(size.width), Universal_Height(size.height))

#define Device_Scale [UIScreen mainScreen].scale
#define Is_Large_Screen ([UIScreen mainScreen].scale >= 3)
#define WeakSelf(weakSelf) __weak __typeof(&*self) weakSelf = self;

#define FONTOFPX(px) (px / 96) * 72

#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)


// 颜色(RGB)
#define kColor(r, g, b) \
  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define RGBA(r, g, b, a)          \
  [UIColor colorWithRed:r / 255.0 \
                  green:g / 255.0 \
                   blue:b / 255.0 \
                  alpha:a / 255.0]
#define CGRGB(r, g, b) RGB(r, g, b).CGColor
#define iCGRGB(r, g, b) (id) CGRGB(r, g, b)
#define CGRGBA(r, g, b, a) RGBA(r, g, b, a).CGColor
#define iCGRGBA(r, g, b, a) (id) CGRGBA(r, g, b, a)

#define KEY_WINDOW [[UIApplication sharedApplication] keyWindow]

#define Nib_Object(__Name__)                                            \
  [[[NSBundle mainBundle] loadNibNamed:__Name__ owner:self options:nil] \
      firstObject]

//** 沙盒路径
//***********************************************************************************
#define PATH_OF_APP_HOME NSHomeDirectory()
#define PATH_OF_TEMP NSTemporaryDirectory()
#define PATH_OF_DOCUMENT                                                      \
  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, \
                                       YES) objectAtIndex:0]

/* ******************************************************************************************************************
 */
/** DEBUG LOG **/
#ifdef DEBUG

#define DLog(s, ...)                                                  \
  NSLog(@"< %@:(%d) > %@",                                            \
        [[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
        __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

#else

#define DLog(s, ...)

#endif
/* __block +  __week   */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


/* ******************************************************************************************************************
 */
#pragma mark - Frame (宏 x, y, width, height)

// App Frame
#define Window_Bounds [[UIScreen mainScreen] bounds]

// App Frame Height&Width
#define App_Frame_Height [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width [[UIScreen mainScreen] applicationFrame].size.width

//当前屏幕与 XX 屏幕宽度比
#define COEFi5 (App_Frame_Width / 320.0)
#define COEFi6 1

#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height
// MainScreen Height&Width
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width [[UIScreen mainScreen] bounds].size.width

// View 坐标(x,y)和宽高(width,height)
#define X(v) (v).frame.origin.x
#define Y(v) (v).frame.origin.y
#define WIDTH(v) (v).bounds.size.width
#define HEIGHT(v) (v).bounds.size.height

#define MinX(v) CGRectGetMinX((v).frame)
#define MinY(v) CGRectGetMinY((v).frame)

#define MidX(v) CGRectGetMidX((v).frame)
#define MidY(v) CGRectGetMidY((v).frame)

#define MaxX(v) CGRectGetMaxX((v).frame)
#define MaxY(v) CGRectGetMaxY((v).frame)

#define Center(view) CGPointMake(WIDTH(view) / 2.0, HEIGHT(view) / 2.0)

#define RECT_CHANGE_x(v, x) CGRectMake(x, Y(v), WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_y(v, y) CGRectMake(X(v), y, WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_point(v, x, y) CGRectMake(x, y, WIDTH(v), HEIGHT(v))
#define RECT_CHANGE_width(v, w) CGRectMake(X(v), Y(v), w, HEIGHT(v))
#define RECT_CHANGE_height(v, h) CGRectMake(X(v), Y(v), WIDTH(v), h)
#define RECT_CHANGE_size(v, w, h) CGRectMake(X(v), Y(v), w, h)

/* ******************************************************************************************************************
 */
#pragma mark - Funtion Method (宏 方法)

// PNG JPG 图片路径
#define PNGPATH(NAME)                                                         \
  [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] \
                                  ofType:@"png"]
#define JPGPATH(NAME)                                                         \
  [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] \
                                  ofType:@"jpg"]
#define PATH(NAME, EXT) \
  [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define PNG_DISK_IMAGE(NAME)                                                \
  [UIImage                                                                  \
      imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) \
                                                              ofType:@"png"]]
#define PNGIMAGE(NAME) [UIImage imageNamed:(NAME)]
#define JPGIMAGE(NAME)                                                      \
  [UIImage                                                                  \
      imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) \
                                                              ofType:@"jpg"]]
#define IMAGE(NAME, EXT)                                                    \
  [UIImage                                                                  \
      imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) \
                                                              ofType:(EXT)]]

// number转String
#define ToString(int_str) [NSString stringWithFormat:@"%@", @(int_str)]
#define FloatTranslateStr(float_str) \
  [NSString stringWithFormat:@"%.2f", float_str];
#define CutStr(str1,str2) [NSString stringWithFormat:@"%@%@",str1, str2]
// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color) \
                                                     \
  [View.layer setCornerRadius:(Radius)];             \
  [View.layer setMasksToBounds:YES];                 \
  [View.layer setBorderWidth:(Width)];               \
  [View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)         \
                                         \
  [View.layer setCornerRadius:(Radius)]; \
  [View.layer setMasksToBounds:YES]

// 当前版本
#define SystemVersionFloat \
  ([[[UIDevice currentDevice] systemVersion] floatValue])
#define SystemVersionDouble \
  ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SystemVersionString ([[UIDevice currentDevice] systemVersion])
#define IOS7_OR_LATER                                           \
  ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != \
   NSOrderedAscending)
#define IOS8_OR_LATER                                           \
  ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != \
   NSOrderedAscending)
#define IOS9_OR_LATER                                           \
  ([[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != \
   NSOrderedAscending)
#define IOS11_OR_LATER                                           \
([[[UIDevice currentDevice] systemVersion] compare:@"11.0"] != \
NSOrderedAscending)
// 当前语言
#define CURRENTLANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

// 是否Retina屏
#define isRetina                                                     \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(640, 960),                     \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)
// 是否iPhone6——Plus
#define IS_IPHONE_6_PLUS                                                    \
  (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) < \
   DBL_EPSILON)

// 是否iPhone6
#define isiPhone6                                                           \
  (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) < \
   DBL_EPSILON)

// 是否iPhone5
#define isiPhone5                                                    \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(640, 1136),                    \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)
// 是否iPhone4
#define isiPhone4                                                    \
  ([UIScreen instancesRespondToSelector:@selector(currentMode)]      \
       ? CGSizeEqualToSize(CGSizeMake(640, 960),                     \
                           [[UIScreen mainScreen] currentMode].size) \
       : NO)

// 是否IOS7
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
// 是否IOS6
#define isIOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)

// 是否iPad
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// UIView - viewWithTag
#define VIEWWITHTAG(_OBJECT, _TAG) [_OBJECT viewWithTag:_TAG]

// 本地化字符串
/**
 * NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释)
 */
#define LocalString(x, ...) NSLocalizedString(x, nil)
/**
 * NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释)
 */
#define AppLocalString(x, ...) NSLocalizedStringFromTable(x, @"someName", nil)

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)                                       \
                                                                       \
  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                  green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
                   blue:((float)(rgbValue & 0xFF)) / 255.0             \
                  alpha:1.0]

#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

// ARC
#if __has_feature(objc_arc)
/** Compiling with ARC */
#else
/** Compiling without ARC */
#endif

/* ******************************************************************************************************************
 */
#pragma mark - Constants (宏 常量)

/** 时间间隔 */
#define kHUDDuration (1.f)

/** 一天的秒数 */
#define SecondsOfDay (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days) (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days) (24.f * 60.f * 60.f * 1000.f * (Days))

//** textAlignment
//***********************************************************************************

#if !defined __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
#define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#define TextAlignmentLeft UITextAlignmentLeft
#define TextAlignmentCenter UITextAlignmentCenter
#define TextAlignmentRight UITextAlignmentRight

#else
#define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#define TextAlignmentLeft NSTextAlignmentLeft
#define TextAlignmentCenter NSTextAlignmentCenter
#define TextAlignmentRight NSTextAlignmentRight

#endif

#define Left_Mas(mas_view, offSet) \
  make.left.equalTo(mas_view.mas_left).offset((offSet) * COEFi6)
#define Right_Mas(mas_view, offSet) \
  make.right.equalTo(mas_view.mas_right).offset(-(offSet) * COEFi6)
#define Top_Mas(mas_view, offSet) \
  make.top.equalTo(mas_view.mas_top).offset((offSet) * COEFi6)
#define Bottom_Mas(mas_view, offSet) \
  make.bottom.equalTo(mas_view.mas_bottom).offset(-(offSet) * COEFi6)

#define Left_Mas_ViewRight(mas_view, offSet) \
    make.left.equalTo(mas_vie
w.mas_right).offset((offSet) * COEFi6)
#define Right_Mas_ViewLeft(mas_view, offSet) \
    make.right.equalTo(mas_view.mas_left).offset((offSet) * COEFi6)
#define Bottom_Mas_ViewTop(mas_view, offSet) \
  make.bottom.equalTo(mas_view.mas_top).offset(-(offSet) * COEFi6)
#define Top_Mas_ViewBottom(mas_view, offSet) \
make.top.equalTo(mas_view.mas_bottom).offset((offSet) * COEFi6)

#define Width_Mas(offSet) make.width.offset((offSet)* COEFi6)
#define Height_Mas(offSet) make.height.offset((offSet)* COEFi6)

//#define Width_Mas(offSet) make.width.offset(((offSet) == Width) ? (offSet) : (offSet)* COEFi6)
//#define Height_Mas(offSet) make.height.offset(((offSet) == Height) ?  (offSet) : (offSet)* COEFi6)

#define CenterY_Mas(mas_view, offSet) \
  make.centerY.equalTo(mas_view.mas_centerY).offset((offSet)* COEFi6)
#define CenterX_Mas(mas_view, offSet) \
  make.centerX.equalTo(mas_view.mas_centerX).offset((offSet)* COEFi6)
#define Top_Left_Bottom_Right_Mas(view) \
    Left_Mas(view, 0);\
    Right_Mas(view, 0);\
    Top_Mas(view, 0);\
    Bottom_Mas(view, 0);
#endif


