//
//  KKBaseTableViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/7/4.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "KKBaseTableViewController.h"
#import "Masonry.h"
@interface KKBaseTableViewController ()

@end

@implementation KKBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[KKBaseTableView alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.bottom.equalTo(self.view);
        maker.top.equalTo(self.navigationBar.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
