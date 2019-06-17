//
//  ZLHomeViewController.m
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#import "ZLHomeViewController.h"
#import "HomeViewController.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "TYCyclePagerViewCell.h"
@interface ZLHomeViewController ()<TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ZLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"ZLHomeViewController"];
    [self addPagerView];
    [self addPageControl];
    [self loadData];
    
}

- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
//    pagerView.layer.borderWidth = 1;
    //是否自动播
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    _pagerView = pagerView;
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    //pageControl.numberOfPages = _datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
     pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
//    pageControl.pageIndicatorSize = CGSizeMake(12, 6);//椭圆指示器
    //设置指示器颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    //设置指示器图片
    //    pageControl.pageIndicatorImage = [UIImage imageNamed:@"btn_spxq_pulldown"];
    //    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"btn_spxq_pullup"];
    //    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    //    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_pagerView addSubview:pageControl];
    _pageControl = pageControl;
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _pagerView.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 200);
    _pageControl.frame = CGRectMake(0, CGRectGetHeight(_pagerView.frame) - 26, CGRectGetWidth(_pagerView.frame), 26);
}
- (void)loadData {
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 7; ++i) {
        if (i == 0) {
            [datas addObject:[UIColor redColor]];
            continue;
        }
        [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
    }
    _datas = [datas copy];
    _pageControl.numberOfPages = _datas.count;
    [_pagerView reloadData];
    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}
#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    cell.backgroundColor = _datas[index];
    cell.label.text = [NSString stringWithFormat:@"index->%ld",index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*0.8, CGRectGetHeight(pageView.frame)*0.8);
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
//    layout.itemHorizontalCenter = _horCenterSwitch.isOn;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

#pragma mark - action

- (IBAction)switchValueChangeAction:(UISwitch *)sender {
    if (sender.tag == 0) {
        _pagerView.isInfiniteLoop = sender.isOn;
        [_pagerView updateData];
    }else if (sender.tag == 1) {
        _pagerView.autoScrollInterval = sender.isOn ? 3.0:0;
    }else if (sender.tag == 2) {
        _pagerView.layout.itemHorizontalCenter = sender.isOn;
        [UIView animateWithDuration:0.3 animations:^{
            [_pagerView setNeedUpdateLayout];
        }];
    }
}

- (IBAction)sliderValueChangeAction:(UISlider *)sender {
    if (sender.tag == 0) {
        _pagerView.layout.itemSize = CGSizeMake(CGRectGetWidth(_pagerView.frame)*sender.value, CGRectGetHeight(_pagerView.frame)*sender.value);
        [_pagerView setNeedUpdateLayout];
    }else if (sender.tag == 1) {
        _pagerView.layout.itemSpacing = 30*sender.value;
        [_pagerView setNeedUpdateLayout];
    }else if (sender.tag == 2) {
        _pageControl.pageIndicatorSize = CGSizeMake(6*(1+sender.value), 6*(1+sender.value));
        _pageControl.currentPageIndicatorSize = CGSizeMake(8*(1+sender.value), 8*(1+sender.value));
        _pageControl.pageIndicatorSpaing = (1+sender.value)*10;
    }
}

- (IBAction)buttonAction:(UIButton *)sender {
    _pagerView.layout.layoutType = sender.tag;
    [_pagerView setNeedUpdateLayout];
}

- (void)pageControlValueChangeAction:(TYPageControl *)sender {
    NSLog(@"pageControlValueChangeAction: %ld",sender.currentPage);
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
