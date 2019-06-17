//
//  CustomViewController.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNaviBarView.h"

@interface CustomViewController : UIViewController

- (UILabel *)naviBarTitleLabel;

- (void)bringNaviBarToTopmost;

- (void)hideNaviBar:(BOOL)bIsHide;

- (void)hideNaviBarLineView:(BOOL)bIsHide;

- (void)setNaviBarTitle:(NSString *)strTitle;

- (void)setNaviBarTitleColor:(UIColor *)color;

- (void)setNaviBarLeftBtn:(UIButton *)btn;
- (void)setNaviBarLeftBtn:(UIButton *)btn frame:(CGRect)frame;

- (void)setNaviBarRightBtn:(UIButton *)btn;
- (void)setNaviBarRightBtn:(UIButton *)btn frame:(CGRect)frame;//右边第一个按钮（从右往左）
- (void)setNaviBarNextRightBtn:(UIButton *)btn frame:(CGRect)frame;//右边第二个按钮（从右往左）

- (void)naviBarAddCoverView:(UIView *)view;
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
- (void)naviBarRemoveCoverView:(UIView *)view;

- (void)naviBarTitleTarget:(id)target action:(SEL)action;
- (void)setNaviBarTitleView:(UIView *)view frame:(CGRect)frame;

- (void)addOnBackButtonTarget:(id)target action:(SEL)action;

- (UIView *)naviBar;

#pragma mark - 自定义
- (void)setNaviBarRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (void)setNaviBarRightBtnWithImage:(NSString *)image target:(id)target action:(SEL)action;

- (void)setNaviBarLeftBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (void)setNaviBarLeftBtnWithImage:(NSString *)image target:(id)target action:(SEL)action;

- (void)setNaviBarRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action color:(UIColor *)color;

@end
