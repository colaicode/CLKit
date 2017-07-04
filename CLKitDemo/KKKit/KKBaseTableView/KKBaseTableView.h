//
//  KKBaseTableView.h
//  CLKitDemo
//
//  Created by KaKa on 2017/7/4.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBaseTableView : UITableView
@property (nonatomic, strong) NSMutableArray* dataArray;

-(instancetype)initWithStyle:(UITableViewStyle)style;
@end
