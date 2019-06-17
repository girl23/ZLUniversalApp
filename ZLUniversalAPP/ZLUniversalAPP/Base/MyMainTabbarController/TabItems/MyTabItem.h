//
//  CustomNaviBarHeader.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyMainNavigationController.h"

@interface MyTabItem : NSObject

@property (nonatomic, strong) NSString *itemImageName;
@property (nonatomic, strong) NSString *itemHeightedImageName;
@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic, strong) UIViewController *contentViewController;


- (void)setItemInfoWithTitle:(NSString *)itemTitle
               itemImageName:(NSString *)itemImageName
       itemHeightedImageName:(NSString *)itemHeightedImageName
       contentViewController:(UIViewController *)contentViewController;

@end
