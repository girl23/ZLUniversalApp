//
//  MineViewController.m
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#import "MineViewController.h"
#import "JXCategoryView.h"
#import "ListViewController.h"
@interface MineViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;



@end

@implementation MineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"MineViewController"];
    
    // 初始化JXCategoryTitleView,配置JXCategoryTitleView的属性
    self.titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.delegate=self;

    //  添加指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = [UIColor redColor];
    lineView.indicatorWidth=20;//LineView固定长度
    //    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;//LineView与Cell同宽
    self.myCategoryView.indicators = @[lineView];
    
   // 设置联动控制器
    self.listContainerView.didAppearPercent = 0.01; //滚动一点就触发加载
    [self.view addSubview:self.listContainerView];
    //关联cotentScrollView，关联之后才可以互相联动！！！
    self.myCategoryView.contentScrollView=self.listContainerView.scrollView;
    self.myCategoryView.backgroundColor=[UIColor purpleColor];
    
    //设置默认选中
    self.myCategoryView.defaultSelectedIndex = 2;//默认选中
    self.listContainerView.defaultSelectedIndex = 2;
//    ## 代码选中指定index
//
//    当业务需要某个时刻要跳转到指定index，比如当前index=0，用户点击了某个按钮，需要立即跳转到index=3的位置，使用下列代码即可：
//    ```Objective-c
//    [self.categoryView selectItemAtIndex:3];
//    [self.listContainerView didClickSelectedItemAtIndex:3];
//    ```
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

#pragma mark - JXCategoryViewDelegate
//点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    
    NSLog(@"=====%ld",(long)index);
}
//点击选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
   NSLog(@"++++%ld", (long)index);
}
//滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"-----%ld", (long)index);
    //tilteView关联滑动控制器
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
     NSLog(@"@@@@@%ld", (long)index);
    //滑动控制器管理titleView
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
}

#pragma mark - JXCategoryListContainerViewDelegate
//传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    id<JXCategoryListContentViewDelegate> list = [self preferredListAtIndex:index];
    return list;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)preferredListAtIndex:(NSInteger)index {
    
    return [[ListViewController alloc] init];
}

#pragma mark lazy

- (JXCategoryListContainerView *)listContainerView {
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithDelegate:self];
         self.listContainerView.frame = CGRectMake(0, 150, self.view.bounds.size.width, self.view.bounds.size.height);
    }
    return _listContainerView;
}
- (JXCategoryTitleView *)myCategoryView {
    if (_myCategoryView == nil) {
        _myCategoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 50)];
        [self.view addSubview:_myCategoryView];
    }
    return _myCategoryView;
}

- (UIView *)listView {
    return self.view;
}
@end
