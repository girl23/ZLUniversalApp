//
//  CustomNaviBarHeader.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTabItem.h"

@class MyTabViewController;

@protocol CLTabViewControllerDelegate <NSObject>

- (void)clTabViewController:(MyTabViewController *)lTtabBarController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;

@optional
- (BOOL)clTabViewController:(MyTabViewController *)lTtabBarController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;

@end


@interface MyTabViewController : UIViewController

// MyTabItem
@property (nonatomic, strong) NSArray *items;


@property (nonatomic, assign) id <CLTabViewControllerDelegate>delegate;

- (void)setTabrItems:(NSArray *)items;

- (void)tabBarSelectAtIndex:(NSInteger)index;

@end
