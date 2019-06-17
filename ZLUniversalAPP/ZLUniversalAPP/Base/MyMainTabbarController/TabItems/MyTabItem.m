//
//  CustomNaviBarHeader.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "MyTabItem.h"

@implementation MyTabItem
@synthesize itemImageName = _itemImageName;
@synthesize itemHeightedImageName = _itemHeightedImageName;
@synthesize itemTitle = _itemTitle;
@synthesize contentViewController = _contentViewController;

- (void)setItemInfoWithTitle:(NSString *)itemTitle
               itemImageName:(NSString *)itemImageName
       itemHeightedImageName:(NSString *)itemHeightedImageName
       contentViewController:(UIViewController *)contentViewController
{
    _itemTitle = itemTitle;
    _itemImageName = itemImageName;
    _itemHeightedImageName = itemHeightedImageName;
    _contentViewController = contentViewController;
}

@end
