//
//  KKBaseViewController.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseViewController.h"

@interface KKBaseViewController ()
@end

@implementation KKBaseViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    __weak __typeof(self) weakSelf = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _navigationBar = [[KKBaseNavigationBar alloc] init];
    _navigationBar.titleColor = [UIColor whiteColor];
    _navigationBar.title = self.title;
    _navigationBar.leftBlock = ^{
        [weakSelf popToViewController];
    };
    [self.view addSubview:_navigationBar];
    [_navigationBar mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.top.width.equalTo(self.view);
        maker.height.mas_equalTo(64);
    }];

}

#pragma mark --------------- Abstract Methord ---------------
-(void)startRequest{
    
}

-(void)reloadView{
    
}

-(void)popToViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
