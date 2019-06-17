//
//  ZLHelp.h
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};
@interface ZLHelp : NSObject
//生成渐变图片
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize ;
//文字自动适配label
+ (void)label:(UILabel *)label setMiniFontSize:(CGFloat)miniSize forNumberOfLines:(NSInteger)lines;
// 清除PerformRequests和notification
+ (void)cancelPerformRequestAndNotification:(UIViewController *)viewCtrl;
//创建一条线view
+ (UIView *)createLineWithFrame:(CGRect)frame color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
