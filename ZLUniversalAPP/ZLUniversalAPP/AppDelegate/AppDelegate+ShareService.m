//
//  AppDelegate+ShareService.m
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/14.
//  Copyright © 2019 周利. All rights reserved.
//

#import "AppDelegate+ShareService.h"

@implementation AppDelegate (ShareService)
#pragma mark - ShareSDK -
- (void)initShareSDK {
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        //QQ
        [platformsRegister setupQQWithAppId:QQAppId appkey:QQAppSecret];

        //微信
        [platformsRegister setupWeChatWithAppId:WXAppId appSecret:WXAppSecret];
    }];
}
//调用第三方分享界面
-(void)shareWithText:(NSString *)text
              images:(id)images
                 url:(NSURL *)url
               title:(NSString *)title{
    //test:http://47.92.210.184/css_share/html/chaoda.html?chaoda_id=17
    //检查是否安装微信
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:[NSURL URLWithString:@"http://47.92.210.184/css_share/html/chaoda.html?chaoda_id=17"]
                                      title:title
                                       type:SSDKContentTypeAuto];
    
    [ShareSDK showShareActionSheet:nil customItems:@[@(SSDKPlatformSubTypeWechatSession), @(SSDKPlatformSubTypeWechatTimeline), @(SSDKPlatformSubTypeQQFriend)] shareParams:shareParams sheetConfiguration:nil onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
        switch (state) {
            case SSDKResponseStateSuccess:
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
                if (self.shareSuccess) {
                    self.shareSuccess();
                }
                break;
            }
            case SSDKResponseStateFail:
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
                if (self.shareFail) {
                    self.shareFail();
                }
                break;
            }
            default:
                break;
        }
    }];
    
}
//第三方指定平台分享；
-(void)shareWithText:(NSString *)text
              images:(id)images
                 url:(NSURL *)url
               title:(NSString *)title platForm:(ZLShareType)shareType{
    //指定平台分享

    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:url
                                      title:title
                                       type:SSDKContentTypeAuto];
    SSDKPlatformType platformType;
    if (self.shareType==ZLShareTypeWeixin) {
        platformType = SSDKPlatformSubTypeWechatSession;
    } else if (self.shareType ==ZLShareTypeQQ) {
        platformType = SSDKPlatformTypeQQ;
    } else if (self.shareType ==ZLShareTypeFriendCircle) {
        //朋友圈
        platformType = SSDKPlatformSubTypeWechatTimeline;
    }else{
        //提示请制定分享平台
        return;
    }
    UIViewController * vc=[self getCurrentUIVC];
    [ShareSDK share:platformType
         parameters:shareParams
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error)
     {
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
                 [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
                 [vc presentViewController:alertController animated:YES completion:nil];
                 if (self.shareSuccess) {
                     self.shareSuccess();
                 }
                 break;
             }
             case SSDKResponseStateFail:
             {
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
                 [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
                 [vc presentViewController:alertController animated:YES completion:nil];
                 if (self.shareFail) {
                     self.shareFail();
                 }
                 break;
             }
             default:
                 break;
         }
     }];
}
//苹果系统自带的分享(方法未完善)
-(void)shareAction{
    
    UIActivityViewController *activityVC;
    activityVC = [[UIActivityViewController alloc]initWithActivityItems:@[ImageWithName(@"icon_tabbar_homepage_selected")] applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePostToFacebook,UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    [[self getCurrentUIVC] presentViewController:activityVC animated:TRUE completion:nil];
    
    WeakSelf(wself)
    //回调
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            [MBProgressHUD showSuccessMessage:@"分享成功"];

        }else{

            [MBProgressHUD showSuccessMessage:@"分享失败"];
        }
      
    };
}
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    return YES;
}

@end
