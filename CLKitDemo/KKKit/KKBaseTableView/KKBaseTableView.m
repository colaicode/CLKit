//
//  KKBaseTableView.m
//  CLKitDemo
//
//  Created by KaKa on 2017/7/4.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "KKBaseTableView.h"

@implementation KKBaseTableView

-(instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithFrame:CGRectZero style:style];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
        if (style == UITableViewStylePlain) {
            self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        }
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
        _dataArray = [[NSMutableArray alloc] init];
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}

@end
