//
//  AppDelegate+ShareService.h
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/14.
//  Copyright © 2019 周利. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
typedef NS_ENUM(NSUInteger, ZLShareType) {
    ZLShareTypeWeixin,
    ZLShareTypeQQ,
    ZLShareTypeFriendCircle,
    ZLShareTypeOther,
};
NS_ASSUME_NONNULL_BEGIN
typedef void (^shareSuccessBlock)(void);
typedef void (^shareFailBlock)(void);
@interface AppDelegate (ShareService)
@property (nonatomic,strong) shareSuccessBlock shareSuccess;
@property (nonatomic,strong) shareFailBlock shareFail;
@property (nonatomic,assign) ZLShareType shareType;

- (void)initShareSDK;
//调用第三方分享界面
-(void)shareWithText:(NSString *)text
             images:(id)images
                url:(NSURL *)url
              title:(NSString *)title;
//第三方指定平台分享；
-(void)shareWithText:(NSString *)text
              images:(id)images
                 url:(NSURL *)url
               title:(NSString *)title platForm:(ZLShareType)shareType;
@end

NS_ASSUME_NONNULL_END
