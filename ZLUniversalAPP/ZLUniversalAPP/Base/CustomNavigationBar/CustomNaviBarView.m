//
//  CustomNaviBarView.m
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "CustomNaviBarView.h"

#define FLOAT_TitleSizeNormal               17.0f
#define FLOAT_TitleSizeMini                 14.0f
#define RGB_TitleNormal                     [UIColor blackColor]
#define RGB_TitleMini                       [UIColor blackColor]

@interface CustomNaviBarView ()

@property (nonatomic, readonly) UIButton *m_btnBack;
@property (nonatomic, readonly) UILabel *m_labelTitle;
@property (nonatomic, readonly) UIButton *m_btnLeft;
@property (nonatomic, readonly) UIButton *m_btnRight;
@property (nonatomic, readonly) UIButton *m_btnNextRight;

@end

@implementation CustomNaviBarView

@synthesize m_btnBack = _btnBack;
@synthesize m_labelTitle = _labelTitle;
@synthesize m_btnLeft = _btnLeft;
@synthesize m_btnRight = _btnRight;
@synthesize m_btnNextRight = _btnNextRight;

+ (CGRect)rightBtnFrame
{
    return Rect(ScreenWidth - [[self class] barBtnSize].width, Height_StatusBar+2, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
}

+ (CGSize)barBtnSize
{
    return Size(50.0f, 40.0f);
}

+ (CGSize)barSize
{
    return Size(ScreenWidth, NaviBarHeight);
}

+ (CGRect)titleViewFrame
{
    return Rect((ScreenWidth - 190.0) / 2.0, Height_StatusBar+2, 190.0f, 40.0f);
}

// 创建一个导航条按钮：只有文字
+ (UIButton *)createNaviBarTextBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithWhite:0.420 alpha:1.000] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [ZLHelp label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    
    return btn;
}

// 创建一个导航条按钮
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    return [self createNormalNaviBarBtnByTitle:strTitle target:target action:action color:[UIColor blackColor]];
}

+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action color:(UIColor *)color
{
    UIButton *btn = [[self class] createImgNaviBarBtnByImgNormal:@"NaviBtn_Normal" imgHighlight:@"NaviBtn_Normal_H" target:target action:action];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [ZLHelp label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    
    return btn;
}

// 创建一个导航条按钮
+ (UIButton *)createNormalNaviBarBtnByLongTitle:(NSString *)strTitle target:(id)target action:(SEL)action width:(CGFloat)width
{
    UIButton *btn = [[self class] createImgNaviBarBtnByImgNormal:@"NaviBtn_Normal" imgHighlight:@"NaviBtn_Normal_H" target:target action:action];
    
    CGRect frame = btn.frame;
    frame.size.width = width;
    btn.frame = frame;
    
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [ZLHelp label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    
    return btn;
}

// 创建一个导航条按钮：自定义按钮图片。
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action
{
    return [[self class] createImgNaviBarBtnByImgNormal:strImg imgHighlight:strImgHighlight imgSelected:strImg target:target action:action];
}
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
//    UIImage *imgNormal = [[UIImage imageNamed:strImg] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *imgNormal =[[UIImage imageNamed:strImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    if (strImgHighlight) {
//        [btn setImage:[[UIImage imageNamed:strImgHighlight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
          [btn setImage:[[UIImage imageNamed:strImgHighlight] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    }
    
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    
    CGFloat fDeltaWidth = ([[self class] barBtnSize].width - imgNormal.size.width)/2.0f;
    CGFloat fDeltaHeight = ([[self class] barBtnSize].height - imgNormal.size.height)/2.0f;
    fDeltaWidth = (fDeltaWidth >= 2.0f) ? fDeltaWidth/2.0f : 0.0f;
    fDeltaHeight = (fDeltaHeight >= 2.0f) ? fDeltaHeight/2.0f : 0.0f;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, fDeltaWidth, fDeltaHeight, fDeltaWidth)];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, -imgNormal.size.width, fDeltaHeight, fDeltaWidth)];
    
    return btn;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initUI];
}


- (void)initUI
{
    self.backgroundColor = AppToolNaviBarColor;
    
    // 默认左侧显示返回按钮
    _btnBack = [[self class] createImgNaviBarBtnByImgNormal:@"icon_nav_back" imgHighlight:@"icon_nav_back" target:self action:@selector(btnBack:)];
//    _btnBack.tintColor = [UIColor whiteColor];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _labelTitle.backgroundColor = [UIColor clearColor];
    _labelTitle.textColor = color51;//RGB_TitleNormal;
    _labelTitle.font = FontBold(18);
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    [ZLHelp label:_labelTitle setMiniFontSize:FLOAT_TitleSizeMini forNumberOfLines:1];
    
    
    _labelTitle.frame = [[self class] titleViewFrame];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:Rect(0, self.bounds.size.height - 0.5f, ScreenWidth, 0.5f)];
    bottomLine.tag = LineTag;
    bottomLine.backgroundColor = RGB(185.0, 185.0, 185.0);
    [self addSubview:bottomLine];
    
    [self addSubview:_labelTitle];
    
    [self setLeftBtn:_btnBack];
//    _btnBack.frame = RectSetX(_btnBack.frame, -10);
}

- (UIButton *)backButton {
    return _btnBack;
}

- (void)hideLineView:(BOOL)isHide
{
    UIView *bottomLine = [self viewWithTag:LineTag];
    bottomLine.hidden = isHide;
}

- (void)setTitle:(NSString *)strTitle
{
    [_labelTitle setText:strTitle];
}

- (UILabel *)titleLabel {
    return _labelTitle;
}

- (void)setTitleColor:(UIColor *)color
{
    [_labelTitle setTextColor:color];
}

- (void)setLeftBtn:(UIButton *)btn
{
    if (_btnLeft)
    {
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }else{}
    
    _btnLeft = btn;
    if (_btnLeft)
    {
        _btnLeft.frame = Rect(2.0f, Height_StatusBar+2, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
        [self addSubview:_btnLeft];
    }else{}
}
- (void)setLeftBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_btnLeft)
    {
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }else{}
    
    _btnLeft = btn;
    if (_btnLeft)
    {
        _btnLeft.frame = frame;
        [self addSubview:_btnLeft];
    }else{}
}

- (void)setRightBtn:(UIButton *)btn
{
    
    [self setRightBtn:btn frame:[[self class] rightBtnFrame]];
}

- (void)setRightBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_btnRight)
    {
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }else{}
    
    _btnRight = btn;
    if (_btnRight)
    {
        _btnRight.frame = frame;
        [self addSubview:_btnRight];
    }else{}
}

- (void)setNextRightBtn:(UIButton *)btn frame:(CGRect)frame
{
    if (_btnNextRight) {
        [_btnNextRight removeFromSuperview];
        _btnNextRight = nil;
    }
    _btnNextRight = btn;
    if (_btnNextRight) {
        _btnNextRight.frame = frame;
        [self addSubview:_btnNextRight];
    }
}

- (void)btnBack:(id)sender
{
    if (self.m_viewCtrlParent)
    {
        [self.m_viewCtrlParent.navigationController popViewControllerAnimated:YES];
    }
}

- (void)showCoverView:(UIView *)view
{
    [self showCoverView:view animation:NO];
}
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation
{
    if (view)
    {
        [self hideOriginalBarItem:YES];
        
        [view removeFromSuperview];
        
        view.alpha = 0.4f;
        [self addSubview:view];
        if (bIsAnimation)
        {
            [UIView animateWithDuration:0.2f animations:^()
             {
                 view.alpha = 1.0f;
             }completion:^(BOOL f){}];
        }
        else
        {
            view.alpha = 1.0f;
        }
    }else{}
}

- (void)showCoverViewOnTitleView:(UIView *)view
{
    if (view)
    {
        if (_labelTitle)
        {
            _labelTitle.hidden = YES;
        }else{}
        
        [view removeFromSuperview];
        view.frame = _labelTitle.frame;
        
        [self addSubview:view];
    }else{}
}

- (void)hideCoverView:(UIView *)view
{
    [self hideOriginalBarItem:NO];
    if (view && (view.superview == self))
    {
        [view removeFromSuperview];
    }else{}
}

- (void)addNavTitleTarget:(id)target action:(SEL)action{
    if (_labelTitle) {
        _labelTitle.userInteractionEnabled = YES;
        [_labelTitle addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    }
    
}

- (void)addOnBackButtonTarget:(id)target action:(SEL)action{
    if (_btnLeft == _btnBack) {
        
        [_btnBack removeTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
        
        [_btnBack addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setNaviBarTitleView:(UIView *)view frame:(CGRect)frame
{
    if (view)
    {
        [view removeFromSuperview];
        view.frame = frame;
        view.center = CGPointMake(self.bounds.size.width / 2.0, view.center.y);
        
        [self addSubview:view];
    }else{}
}

#pragma mark -
- (void)hideOriginalBarItem:(BOOL)bIsHide
{
    if (_btnLeft)
    {
        _btnLeft.hidden = bIsHide;
    }else{}
    if (_btnBack)
    {
        _btnBack.hidden = bIsHide;
    }else{}
    if (_btnRight)
    {
        _btnRight.hidden = bIsHide;
    }else{}
    if (_labelTitle)
    {
        _labelTitle.hidden = bIsHide;
    }else{}
}

@end
