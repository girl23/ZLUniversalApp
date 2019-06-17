//
//  UserManager.m
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/14.
//  Copyright © 2019 周利. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager
SINGLETON_FOR_CLASS(UserManager);

-(instancetype)init{
    self = [super init];
    if (self) {
        //被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKick)
                                                     name:KNotificationOnKick
                                                   object:nil];
    }
    return self;
}
#pragma mark ————— 三方登录 —————
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion{
    [self login:loginType params:nil completion:completion];
}

#pragma mark ————— 带参数登录 —————
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(loginBlock)completion{
//    //友盟登录类型
//    UMSocialPlatformType platFormType;
//
//    if (loginType == kUserLoginTypeQQ) {
//        platFormType = UMSocialPlatformType_QQ;
//    }else if (loginType == kUserLoginTypeWeChat){
//        platFormType = UMSocialPlatformType_WechatSession;
//    }else{
//        platFormType = UMSocialPlatformType_UnKnown;
//    }
//    //第三方登录
//    if (loginType != kUserLoginTypePwd) {
//        [MBProgressHUD showActivityMessageInView:@"授权中..."];
//        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platFormType currentViewController:nil completion:^(id result, NSError *error) {
//            if (error) {
//                [MBProgressHUD hideHUD];
//                if (completion) {
//                    completion(NO,error.localizedDescription);
//                }
//            } else {
//
//                UMSocialUserInfoResponse *resp = result;
//                //
//                //                // 授权信息
//                //                NSLog(@"QQ uid: %@", resp.uid);
//                //                NSLog(@"QQ openid: %@", resp.openid);
//                //                NSLog(@"QQ accessToken: %@", resp.accessToken);
//                //                NSLog(@"QQ expiration: %@", resp.expiration);
//                //
//                //                // 用户信息
//                //                NSLog(@"QQ name: %@", resp.name);
//                //                NSLog(@"QQ iconurl: %@", resp.iconurl);
//                //                NSLog(@"QQ gender: %@", resp.unionGender);
//                //
//                //                // 第三方平台SDK源数据
//                //                NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//
//                //登录参数
//                NSDictionary *params = @{@"openid":resp.openid, @"nickname":resp.name, @"photo":resp.iconurl, @"sex":[resp.unionGender isEqualToString:@"男"]?@1:@2, @"cityname":resp.originalResponse[@"city"], @"fr":@(loginType)};
//
//                self.loginType = loginType;
//                //手动登录到服务器
//                [self loginToServer:params completion:completion];
//            }
//        }];
//    }else{
//        //账号登录 暂未提供
//
//    }
}
#pragma mark ————— 手动登录到服务器(非第三方登录) ————
-(void)loginToServer:(NSDictionary *)params completion:(loginBlock)completion{
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    [PPNetworkHelper POST:NSStringFormat(@"%@%@",BaseUrl,user_user_login) parameters:params success:^(id responseObject) {
        [self LoginSuccess:responseObject completion:completion];
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        if (completion) {
            completion(NO,error.localizedDescription);
        }
    }];
}
#pragma mark ————— 登录成功处理 —————
-(void)LoginSuccess:(id )responseObject completion:(loginBlock)completion{
    if (ValidDict(responseObject)) {
        if (ValidDict(responseObject[@"data"])) {
            //登录s成功
            NSDictionary *data = responseObject[@"data"];
            [MBProgressHUD hideHUD];
            KPostNotification(KNotificationLoginStateChange, @YES);
        }
    }else{
        if (completion) {
            completion(NO,@"登录返回数据异常");
        }
        KPostNotification(KNotificationLoginStateChange, @NO);
    }
    
}
#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo{
//    if (self.curUserInfo) {
//        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
//        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
//        [cache setObject:dic forKey:KUserModelCache];
//    }
    
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
//    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
//    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
//    if (userDic) {
//        self.curUserInfo = [UserInfo modelWithJSON:userDic];
//        return YES;
//    }
    return NO;
}
#pragma mark ————— 被踢下线 —————
-(void)onKick{
    [self logout:nil];
}
#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    
    self.isLogined = NO;
     //移除缓存
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    [cache removeAllObjectsWithBlock:^{
        if (completion) {
            completion(YES,nil);
        }
    }];
    
    KPostNotification(KNotificationLoginStateChange, @NO);
}

@end
