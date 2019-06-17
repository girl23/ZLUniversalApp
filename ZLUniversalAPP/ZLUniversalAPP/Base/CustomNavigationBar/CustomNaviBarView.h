//
//  CustomNaviBarView.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LineTag -5000

@interface CustomNaviBarView : UIView

@property (nonatomic, weak) UIViewController *m_viewCtrlParent;
@property (nonatomic, readonly) BOOL m_bIsCurrStateMiniMode;

+ (CGRect)rightBtnFrame;
+ (CGSize)barBtnSize;
+ (CGSize)barSize;
+ (CGRect)titleViewFrame;

// 创建一个导航条按钮：只有文字
+ (UIButton *)createNaviBarTextBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;

+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action color:(UIColor *)color;

+ (UIButton *)createNormalNaviBarBtnByLongTitle:(NSString *)strTitle target:(id)target action:(SEL)action width:(CGFloat)width;

// 创建一个导航条按钮：使用默认的按钮图片。
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;

// 创建一个导航条按钮：自定义按钮图片。
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action;

// 用自定义的按钮和标题替换默认内容
- (void)setLeftBtn:(UIButton *)btn;
- (void)setRightBtn:(UIButton *)btn;

- (void)setLeftBtn:(UIButton *)btn frame:(CGRect)frame;

- (void)setRightBtn:(UIButton *)btn frame:(CGRect)frame;
- (void)setNextRightBtn:(UIButton *)btn frame:(CGRect)frame;

- (void)setTitle:(NSString *)strTitle;
- (UILabel *)titleLabel;
- (void)setTitleColor:(UIColor *)color;

- (void)hideLineView:(BOOL)isHide;

// 在导航条上覆盖一层自定义视图。比如：输入搜索关键字时，覆盖一个输入框在上面。
- (void)showCoverView:(UIView *)view;
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation;
- (void)showCoverViewOnTitleView:(UIView *)view;
- (void)hideCoverView:(UIView *)view;

- (void)addNavTitleTarget:(id)target action:(SEL)action;

- (void)addOnBackButtonTarget:(id)target action:(SEL)action;
- (void)setNaviBarTitleView:(UIView *)view frame:(CGRect)frame;

- (UIButton *)backButton;


@end
