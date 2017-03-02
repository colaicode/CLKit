//
//  ActionSheetDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/3/1.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ActionSheetDemoViewController.h"

@interface ActionSheetDemoViewController ()

@end

@implementation ActionSheetDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [KKBaseActionSheet showActionSheet:@"请选择性别" buttons:@[@"男",@"女"] complete:^(NSInteger buttonIndex){
        NSLog(@"%ld",(long)buttonIndex);
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

@end
