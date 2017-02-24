//
//  ViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ViewController.h"
#import "KKKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KKBaseButton* button = [KKBaseButton buttonWithTitle:@"show alertView" actionBlock:^(id sender){
        [KKBaseAlertView showAlert:@"from button" complete:nil];
    }];
    [button setFrame:CGRectMake(100, 100, 200, 40)];
    [self.view addSubview:button];
    
    KKBaseButton* button1 = [KKBaseButton buttonWithTitle:@"show actioSheet" actionBlock:^(id sender){
        [KKBaseActionSheet showActionSheet:@"from button" buttons:@[@"first"] complete:^(NSInteger buttonIndex){
            NSLog(@"buttonIndex ==== %ld",(long)buttonIndex);
        }];
    }];
    [button1 setFrame:CGRectMake(100, 200, 200, 40)];
    [self.view addSubview:button1];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
