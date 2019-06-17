//
//  RootViewControllerInit.m
//  LeeroaCRM
//
//  Created by youli on 2017/6/29.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "RootViewController.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "ZLHomeViewController.h"
#import "MineViewController.h"

@implementation RootViewController

+ (MyTabViewController *)rootViewController
{
    MyTabViewController *tabViewController = [[MyTabViewController alloc] init];

    NSArray *itemTitles =               @[@"首页", @"我的"];
    NSArray *itemImageNames =           @[@"icon_tabbar_homepage",@"icon_tabbar_mine"];
    NSArray *itemHeightedImageNames =   @[@"icon_tabbar_homepage_selected",@"icon_tabbar_mine_selected"];
    NSArray *itemControllers =          @[@"ZLHomeViewController",@"MineViewController"];

    NSMutableArray *items = [NSMutableArray arrayWithCapacity:itemImageNames.count];
    
    for (NSInteger i = 0; i < itemImageNames.count; i++) {
        BaseViewController *vc = [[NSClassFromString(itemControllers[i]) alloc] init];
        vc.title = itemTitles[i];
        vc.tabViewController = tabViewController;
        
        MyTabItem *item = [[MyTabItem alloc] init];
        
        [item setItemInfoWithTitle:itemTitles[i]
                     itemImageName:itemImageNames[i]
             itemHeightedImageName:itemHeightedImageNames[i]
             contentViewController:vc];
        [items addObject:item];
    }
    
    [tabViewController setTabrItems:items];
    
    return tabViewController;
}

@end
