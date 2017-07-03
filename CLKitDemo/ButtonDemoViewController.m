//
//  ButtonDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ButtonDemoViewController.h"
#import "KKBaseButton.h"
#import "Masonry.h"

@interface ButtonDemoViewController ()

@end

@implementation ButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ButtonDemo";
    self.view.backgroundColor = [UIColor lightGrayColor];
    KKBaseButton* sender = [KKBaseButton buttonWithDefaultFont:@"Button"].normalTitleColor([UIColor blueColor]).normalImage(@"home_up").buttonFrame(CGRectMake(100, 100, 100, 40)).selectImage(@"home_down").normalTitleColor([UIColor blackColor]).titleFont(@17);
    [sender upInsideAction:^(KKBaseButton* sender){
        sender.selected = !sender.selected;
    }];
    [self.view addSubview:sender];
    
    KKBaseButton* button = [KKBaseButton buttonWithImage:@"home_up" actionBlock:^(KKBaseButton* sender){
        sender.selected = !sender.selected;
    }].selectImage(@"home_down").normalTitleColor([UIColor blackColor]).bgColor([UIColor greenColor]);
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.equalTo(self.view).offset(40);
        maker.top.equalTo(self.view).offset(200);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
