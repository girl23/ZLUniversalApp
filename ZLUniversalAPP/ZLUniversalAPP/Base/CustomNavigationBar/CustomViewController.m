//
//  CustomViewController.m
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()
{
    
}

@property (nonatomic, readonly) CustomNaviBarView *m_viewNaviBar;

@end

@implementation CustomViewController

@synthesize m_viewNaviBar = _viewNaviBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _viewNaviBar = [[CustomNaviBarView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [CustomNaviBarView barSize].width, [CustomNaviBarView barSize].height)];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [ZLHelp cancelPerformRequestAndNotification:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewNaviBar && !_viewNaviBar.hidden)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

#pragma mark -

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;
}

- (void)hideNaviBarLineView:(BOOL)bIsHide
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideLineView:bIsHide];
    }else{}
}

- (UILabel *)naviBarTitleLabel
{
    if (_viewNaviBar)
    {
        return [_viewNaviBar titleLabel];
    }else{}
    
    return nil;
}

- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }else{}
}

- (void)setNaviBarTitleColor:(UIColor *)color
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitleColor:color];
    }else{}
}

- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{}
}

- (void)setNaviBarLeftBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn frame:frame];
    }else{}
}
- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{}
}

- (void)setNaviBarRightBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn frame:frame];
    }else{}
}

- (void)setNaviBarNextRightBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_viewNaviBar) {
        [_viewNaviBar setNextRightBtn:btn frame:frame];
    }
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }else{}
}

- (void)naviBarAddCoverViewOnTitleView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }else{}
}

- (void)naviBarRemoveCoverView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }else{}
}

- (void)naviBarTitleTarget:(id)target action:(SEL)action{
    if (_viewNaviBar) {
        [_viewNaviBar addNavTitleTarget:target action:action];
    }
}

- (void)setNaviBarTitleView:(UIView *)view frame:(CGRect)frame{
    if (_viewNaviBar)
    {
        [_viewNaviBar setNaviBarTitleView:view frame:frame];
    }else{}
}


- (void)addOnBackButtonTarget:(id)target action:(SEL)action{
    if (_viewNaviBar) {
        [_viewNaviBar addOnBackButtonTarget:target action:action];
    }else{}
}

- (UIView *)naviBar{
    if (_viewNaviBar) {
        return _viewNaviBar;
    }
    return nil;
}

#pragma mark - 自定义
- (void)setNaviBarRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    [self setNaviBarRightBtn:[CustomNaviBarView createNormalNaviBarBtnByTitle:title target:target action:action]];
}

- (void)setNaviBarRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action color:(UIColor *)color{
    [self setNaviBarRightBtn:[CustomNaviBarView createNormalNaviBarBtnByTitle:title target:target action:action color:color]];
}

- (void)setNaviBarRightBtnWithImage:(NSString *)image target:(id)target action:(SEL)action {
    [self setNaviBarRightBtn:[CustomNaviBarView createImgNaviBarBtnByImgNormal:image imgHighlight:image target:target action:action]];
}

- (void)setNaviBarLeftBtnWithImage:(NSString *)image target:(id)target action:(SEL)action {
    [self setNaviBarLeftBtn:[CustomNaviBarView createImgNaviBarBtnByImgNormal:image imgHighlight:image target:target action:action]];
}

- (void)setNaviBarLeftBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    [self setNaviBarLeftBtn:[CustomNaviBarView createNormalNaviBarBtnByTitle:title target:target action:action]];
}

@end
