//
//  ButtonDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ButtonDemoViewController.h"
#import "KKBaseButton.h"
@interface ButtonDemoViewController ()

@end

@implementation ButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ButtonDemo";
    self.view.backgroundColor = [UIColor lightGrayColor];
    KKBaseButton* sender = [KKBaseButton buttonWithDefaultFont:@"Button"].normalTitleColor([UIColor blueColor]).normalImage(@"home_up").buttonFrame(CGRectMake(100, 100, 100, 40)).selectImage(@"home_down").normalTitleColor([UIColor blackColor]);
    [sender upInsideAction:^(KKBaseButton* sender){
        sender.selected = !sender.selected;
    }];
    [self.view addSubview:sender];
    
    KKBaseButton* button = [KKBaseButton buttonWithImage:@"home_up" actionBlock:^(KKBaseButton* sender){
        sender.selected = !sender.selected;
    }].buttonFrame(CGRectMake(100, 200, 100, 40)).selectImage(@"home_down").normalTitleColor([UIColor blackColor]);
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
