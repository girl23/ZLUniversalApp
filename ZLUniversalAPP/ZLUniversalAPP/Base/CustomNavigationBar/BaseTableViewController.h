//
//  BaseTableViewController.h
//  ChaoShenSu
//
//  Created by tudan on 2018/7/17.
//  Copyright © 2018年 BingFor. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, assign)UITableViewStyle tableViewStyle;
- (void)commonInit;

@end
