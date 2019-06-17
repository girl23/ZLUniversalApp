//
//  TDVerticalButton.h
//  Project
//
//  Created by youli on 2017/9/11.
//  Copyright © 2017年 youli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCBadgeButton.h"

/**样式
     logo +消息数量
      +
     title
 */

@interface TDVerticalButton : UIButton

@property (copy,nonatomic) NSString *badgeValue; //消息数量

@end
