//
//  BaseViewController.m
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIView *basicView;
@property (nonatomic, strong) UIImageView *noDataLogoImageView;
@property (nonatomic, strong) UILabel *noDataTipLabel;

@end

@implementation BaseViewController
@synthesize tabViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.noDataTipString=@"很抱歉，没有数据";
    CustomNaviBarView *naviBarView = (CustomNaviBarView *)[self naviBar];
    naviBarView.backgroundColor = [UIColor orangeColor];
    [naviBarView setTitleColor:[UIColor redColor]];
    [naviBarView hideLineView:YES];
    self.view.backgroundColor = BackgroundColor;
    
    self.basicView = [[UIView alloc] init];
    self.basicView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:self.basicView];
    [self.basicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.offset(200);
    }];
    
    self.noDataLogoImageView = [[UIImageView alloc] init];
    self.noDataLogoImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.noDataLogoImageView.hidden = NO;
    self.noDataLogoImageView.backgroundColor=[UIColor redColor];
    [self.basicView addSubview:self.noDataLogoImageView];
    
    [self.noDataLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.height.offset(110);
        make.width.offset(110);
        make.centerX.equalTo(self.basicView.mas_centerX);
       
    }];
    
    self.noDataTipLabel = [[UILabel alloc] init];
    self.noDataTipLabel.textAlignment = NSTextAlignmentCenter;
    self.noDataTipLabel.textColor = SubTitleColor;
    self.noDataTipLabel.font = Font(15);
    self.noDataTipLabel.backgroundColor=[UIColor blueColor];
    self.noDataTipLabel.text=self.noDataTipString;
    [self.basicView addSubview:self.noDataTipLabel];
    [self.noDataTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.noDataLogoImageView.mas_bottom).offset(14);
    }];
    
    self.goShoppintButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.goShoppintButton setTitle:@"去逛逛" forState:UIControlStateNormal];
    [self.goShoppintButton setTitleColor:AppColor forState:UIControlStateNormal];
    self.goShoppintButton.titleLabel.font = Font(15);
    [self.basicView addSubview:self.goShoppintButton];
    
    [self.goShoppintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(100);
        make.height.offset(38);
        make.centerX.equalTo(self.basicView.mas_centerX);
        make.top.equalTo(self.noDataTipLabel.mas_bottom).offset(14);
    }];
    self.goShoppintButton.layer.borderColor = AppColor.CGColor;
    self.goShoppintButton.layer.borderWidth = 0.5;
    self.goShoppintButton.layer.cornerRadius = 19;
    self.goShoppintButton.clipsToBounds = YES;
    
    [self HideNoDataView];
    //动态计算视图高度
    
    
}

- (void)tabPushViewController:(UIViewController *)viewController{
    if (self.tabViewController) {
        [self.tabViewController.navigationController pushViewController:viewController animated:YES];
    } else {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (UIViewController *)currentTopViewController{
    if (self.tabViewController) {
        return self.tabViewController;
    }else{
        return self;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
    
}
-(void)resetNOdataViewConstraint{
    CGFloat imgH=110,TipH=0,BtnH=38,space=14;
    TipH=[_noDataTipString sizeWithpreferHeight:ScreenWidth-40 font:Font(15)].height;
    CGFloat viewHeight=imgH+TipH+BtnH+2*space;
    [self.basicView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(viewHeight);
    }];
}
-(void)showNoDataView{
  
    self.basicView.hidden=NO;
    self.noDataLogoImageView.hidden=NO;
    self.noDataTipLabel.hidden=NO;
    self.goShoppintButton.hidden=NO;
    [self resetNOdataViewConstraint];
   
}
-(void)HideNoDataView{
    self.basicView.hidden=YES;
    self.noDataLogoImageView.hidden=YES;
    self.noDataTipLabel.hidden=YES;
    self.goShoppintButton.hidden=YES;
    
}
- (void)setNoDataTipString:(NSString *)noDataTipString {
    _noDataTipString = noDataTipString;
    self.noDataTipLabel.text = noDataTipString;
}

- (void)setTipImageName:(NSString *)tipImageName {
    _tipImageName = tipImageName;
    self.noDataLogoImageView.image = ImageWithName(tipImageName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
