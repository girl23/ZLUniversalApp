//
//  BaseViewController.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

/**
    使用本控制器作为其他控制器的根控制器
 */

#import "CustomViewController.h"
#import "MyTabViewController.h"

@interface BaseViewController : CustomViewController

@property (nonatomic, strong) MyTabViewController *tabViewController;

@property (nonatomic, strong) BaseViewController *pViewController;

//数据为空时
@property (nonatomic, copy) NSString *tipImageName;
@property (nonatomic, copy) NSString *noDataTipString;
@property (nonatomic, strong) UIButton *goShoppintButton;//重新加载数据；

/**
 *  显示没有数据页面，默认不显示
 */
-(void)showNoDataView;
/**
 *  移除无数据页面
 */
-(void)HideNoDataView;


@property (nonatomic, strong) void(^needRefresh)(void);

- (void)tabPushViewController:(UIViewController *)viewController;

- (UIViewController *)currentTopViewController;

@end
