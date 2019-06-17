//
//  HomeViewController.m
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   [self setNaviBarTitle:@"HomeViewController"];
    NSDictionary *param;
    NSString * str=NSStringFormat(@"%@%@",BaseUrl,user_product_getMemberCategory);
    
//    [PPNetworkHelper POST:str parameters:nil success:^(id responseObject) {
//
//    } failure:^(NSError *error) {
//
//    }];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(30, 100, 100, 100)];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}
-(void)click{
    
//    [MBProgressHUD showTipMessageInWindow:@"哈哈哈哈哈哈哈"];
//    [MBProgressHUD showTipMessageInView:@"哈哈哈哈哈哈哈哈哈"];

//       [MBProgressHUD showTipMessageInView:@"哈哈哈哈哈哈哈哈哈" timer:20];
    
//     [MBProgressHUD showSuccessMessage:@"gg"];
//    [MBProgressHUD showErrorMessage:@"erro"];
//    [MBProgressHUD showInfoMessage:@"gghg"];
//    [MBProgressHUD showWarnMessage:@"ggg"];
    [MBProgressHUD showCustomIconInView:@"icon_tabbar_mine_selected" message:@"gg"];
//    + (void)showTipMessageInWindow:(NSString*)message;
//    + (void)showTipMessageInView:(NSString*)message;
//    + (void)showTipMessageInWindow:(NSString*)message timer:(float)aTimer;
//    + (void)showTipMessageInView:(NSString*)message timer:(float)aTimer;
//
//
//    + (void)showActivityMessageInWindow:(NSString*)message;
//    + (void)showActivityMessageInView:(NSString*)message;
//    + (void)showActivityMessageInWindow:(NSString*)message timer:(float)aTimer;
//    + (void)showActivityMessageInView:(NSString*)message timer:(float)aTimer;
//
//
//    + (void)showSuccessMessage:(NSString *)Message;
//    + (void)showErrorMessage:(NSString *)Message;
//    + (void)showInfoMessage:(NSString *)Message;
//    + (void)showWarnMessage:(NSString *)Message;
//
//
//    + (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
//    + (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;
//
//
//    + (void)hideHUD;
//
//    //顶部弹出提示
//    + (void)showTopTipMessage:(NSString *)msg;
//    + (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
