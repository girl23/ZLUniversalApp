//
//  CustomNaviBarHeader.h
//  LeeroaCRM
//
//  Created by youli on 2017/6/27.
//  Copyright © 2017年 Leeroa. All rights reserved.
//

#import "MyTabViewController.h"
#import "TDVerticalButton.h"

#define ItemIndexOffSet 1000
#define ItemTitleLabelTag (-1000)
#define TabBarViewTag 10000

#define RGB_TabCustomColor             RGB(34.0f, 34.0f, 34.0f)
#define TabBarHeight 44


@interface MyTabViewController () //<EMChatManagerDelegate>
{
    UIView *tabBarView;
    UIView *contentView;
    
    NSInteger _selectIndex;
    
    UIViewController *_currentSelectViewController;
}
@end

@implementation MyTabViewController
@synthesize items = _items;
@synthesize delegate = _delegate;

- (void)dealloc {
    [ZLHelp cancelPerformRequestAndNotification:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
//    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshDialogueNum:) name:@"RefreshDialogueNum" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([_currentSelectViewController respondsToSelector:@selector(viewWillAppear:)]) {
        [_currentSelectViewController viewWillAppear:animated];
    }
}

- (void)setTabrItems:(NSArray *)items{
    _items = items;
    
    _selectIndex = NSNotFound;
    
    [self layoutSubContentView];
    
    [self layoutContentItems];
}

- (void)layoutContentItems{
    if (!_items || _items.count == 0) {
        return;
    }
    
    CGFloat itemWidth = ScreenWidth / _items.count;
    for (MyTabItem *tabItem in _items) {
        NSInteger itemIndex = [_items indexOfObject:tabItem];
        
        TDVerticalButton *itemButton = [[TDVerticalButton alloc] init];
        itemButton.frame = Rect(itemIndex * itemWidth, 2, itemWidth, TabBarHeight);
        itemButton.tag = itemIndex + ItemIndexOffSet;
        itemButton.titleLabel.font = Font(10);
        [itemButton setImage:ImageWithName(tabItem.itemImageName) forState:UIControlStateNormal];
        [itemButton setImage:ImageWithName(tabItem.itemHeightedImageName) forState:UIControlStateSelected];
        [itemButton setTitle:tabItem.itemTitle forState:UIControlStateNormal];
        [itemButton setTitleColor:TitleColor forState:UIControlStateNormal];
        [itemButton setTitleColor:AppColor forState:UIControlStateSelected];
        [itemButton addTarget:self action:@selector(itemButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarView addSubview:itemButton];
    }
    [self tabBarSelectAtIndex:0];
}

- (UILabel *)menuButtonTitleLabel{
    __autoreleasing UILabel *resLabel = [[UILabel alloc] init];
    resLabel.font = [UIFont systemFontOfSize:10];
    resLabel.textAlignment = NSTextAlignmentCenter;
    resLabel.textColor = RGB_TabCustomColor;
    resLabel.tag = ItemTitleLabelTag;
    resLabel.backgroundColor = [UIColor clearColor];
    return resLabel;
}

- (void)layoutSubContentView{
    tabBarView = [[UIView alloc] initWithFrame:Rect(0, ScreenHeight - TabBarHeight - TabBarBottomMargin, ScreenWidth, TabBarHeight + TabBarBottomMargin)];
    tabBarView.backgroundColor = AppToolNaviBarColor;
    tabBarView.tag = TabBarViewTag;
    [self.view addSubview:tabBarView];
    
    
    contentView = [[UIView alloc] initWithFrame:Rect(0, 0, ScreenWidth, ScreenHeight - TabBarHeight - TabBarBottomMargin)];
    contentView.clipsToBounds = YES;
    contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentView];
    
    [tabBarView addSubview:LineRectColor(0, 0, ScreenWidth, 0.5f, 216, 216, 216)];
}

#pragma mark - TabBar Pressed
- (void)itemButtonPressed:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    
    [self tabBarSelectAtIndex:sender.tag - ItemIndexOffSet];
}

- (void)tabBarSelectAtIndex:(NSInteger)index{
    NSAssert(index < [self.items count], @"View controller index out of bounds");
    
    if (index == 3 || index == 2 || index == 1) {
//        if ([TDUsefulTool isLoginShowLogin:YES]) {
//            return;
//        }
    }
    if ([_delegate respondsToSelector:@selector(clTabViewController:shouldSelectViewController:atIndex:)]) {
        UIViewController *toViewController = [[_items objectAtIndex:index] contentViewController];
        if (![_delegate clTabViewController:self shouldSelectViewController:toViewController atIndex:index]) {
            return;
        }
    }
    
    if (_currentSelectViewController) {
        [_currentSelectViewController.view removeFromSuperview];
        [_currentSelectViewController removeFromParentViewController];
    }
    
    if (_selectIndex != NSNotFound) {
        [self setTabBarItemSelected:NO withIndex:_selectIndex];
    }
    [self setTabBarItemSelected:YES withIndex:index];
    
    UIViewController *viewController = [[_items objectAtIndex:_selectIndex] contentViewController];
    viewController.view.frame = contentView.bounds;
    [contentView addSubview:viewController.view];
    _currentSelectViewController = viewController;
    
    if ([_delegate respondsToSelector:@selector(clTabViewController:didSelectViewController:atIndex:)]) {
        [_delegate clTabViewController:self didSelectViewController:viewController atIndex:index];
    }
    
}

- (void)setTabBarItemSelected:(BOOL)selected withIndex:(NSInteger)index{
    UIButton *barButton = (UIButton *)[tabBarView viewWithTag:index + ItemIndexOffSet];
    [barButton setSelected:selected];
    _selectIndex = index;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
//    return UIStatusBarStyleLightContent;
     return UIStatusBarStyleDefault;
    
}

#pragma mark - 易生活-会话数量刷新
//刷新购物车数量
- (void)refreshDialogueNum:(NSNotification *)noti {
    NSString *unReadNums = noti.object;
    TDVerticalButton *shoppingCartButton = [self.view viewWithTag:1 + ItemIndexOffSet];
    shoppingCartButton.badgeValue = [unReadNums isEqualToString:@"0"] ? @"" : unReadNums;
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
