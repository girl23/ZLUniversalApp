//
//  RootViewControllerInit.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/29.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTabViewController.h"

@interface RootViewController : NSObject
@property(nonatomic,strong)MyTabViewController *mytabViewController;
+ (MyTabViewController *)rootViewController;

@end
