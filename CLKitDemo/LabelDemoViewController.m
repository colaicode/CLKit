//
//  LabelDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "LabelDemoViewController.h"
#import "KKBaseLabel.h"

@interface LabelDemoViewController ()

@end

@implementation LabelDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    KKBaseLabel* label = [KKBaseLabel subheadlineLable]
                         .labelTextColor([UIColor redColor])
                         .labelAlignment(NSTextAlignmentLeft)
                         .labelFrame(CGRectMake(100, 100, 100, 40))
                         .labelBgColor([UIColor darkTextColor])
                         .labelText(@"text");
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
