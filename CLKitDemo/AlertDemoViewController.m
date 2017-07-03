//
//  AlertDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/3/1.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "AlertDemoViewController.h"
#import "KKBaseAlertView.h"
@interface AlertDemoViewController ()

@end

@implementation AlertDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [KKBaseAlertView showAlert:@"viewDidAppear" buttons:@[@"返回",@"取消"] complete:^(NSInteger buttonIndex){
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

@end
