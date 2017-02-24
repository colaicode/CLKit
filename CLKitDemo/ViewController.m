//
//  ViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ViewController.h"
#import "ButtonDemoViewController.h"
#import "KKKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KKBaseButton* button = [KKBaseButton buttonWithTitle:@"show buttonDemo" actionBlock:^(id sender){
        ButtonDemoViewController* vc = [ButtonDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }].normalTitleColor([UIColor blackColor]).buttonFrame(CGRectMake(100, 100, 200, 40));
    [button setFrame:CGRectMake(100, 100, 200, 40)];
    [self.view addSubview:button];
    
    KKBaseButton* button1 = [KKBaseButton buttonWithTitle:@"show LabelDemo" actionBlock:^(id sender){
        [self.navigationController pushViewController:[NSClassFromString(@"LabelDemoViewController") new] animated:YES];
        
    }].normalTitleColor([UIColor blackColor]).buttonFrame(CGRectMake(100, 200, 200, 40));
    [self.view addSubview:button1];
    
    [KKBaseAlertView showAlert:@"alert" complete:^(NSInteger buttonIndex){
        NSLog(@"%ld",(long)buttonIndex);
    }];
    
    [KKBaseActionSheet showActionSheet:@"请选择性别" buttons:@[@"男",@"女"] complete:^(NSInteger buttonIndex){
        NSLog(@"%ld",(long)buttonIndex);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
