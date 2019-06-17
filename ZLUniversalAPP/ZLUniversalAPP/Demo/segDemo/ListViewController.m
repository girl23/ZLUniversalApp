//
//  ListViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/8.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "ListViewController.h"

#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:btn];
}
-(void)click{

    [[AppDelegate shareAppDelegate] shareWithText:@"分享" images:ImageWithName(@"icon_tabbar_homepage_selected") url:URL(@"http://www.baidu.com") title:@"titel"];
}
#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}


@end
