//
//  AppDelegate+AppService.h
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (AppService)
//初始化 window
-(void)initWindow;
/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;
//单例
+ (AppDelegate *)shareAppDelegate;

@end

NS_ASSUME_NONNULL_END
