//
//  FontAndColorMacros.h
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark -  间距区

//默认间距
#define KNormalSpace 12.0f

#pragma mark -  颜色区

#define RGB(r,g,b)      [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

#define RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成
//颜色
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]

#define SubTitleColor           RGB(138, 140, 139) //副文本字体颜色

#define AppColor     [UIColor colorWithHexString:@"00AE68"]

#define AppToolNaviBarColor     RGB(255, 255, 255)

#define BackgroundColor         RGB(244, 244, 244) //背景色

#define LineColor               RGB(216, 216, 216) //分割线

#define TitleColor              RGB(51,51,51) //默认字体颜色

#define color51                 RGB(51, 51, 51)

//主题色 导航栏颜色
#define CNavBgColor  [UIColor colorWithHexString:@"00AE68"]

#define CNavBgFontColor  [UIColor colorWithHexString:@"ffffff"]

//默认页面背景色
#define CViewBgColor [UIColor colorWithHexString:@"f2f2f2"]

//分割线颜色
#define CLineColor [UIColor colorWithHexString:@"ededed"]

//次级字色
#define CFontColor1 [UIColor colorWithHexString:@"1f1f1f"]

//再次级字色
#define CFontColor2 [UIColor colorWithHexString:@"5c5c5c"]


#pragma mark -  字体区

//#define Font [UIFont systemFontOfSize:12.0f]
#define FontBold(s)         [UIFont boldSystemFontOfSize:s]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define Font(s)                 [UIFont systemFontOfSize:s]
#endif /* FontAndColorMacros_h */
