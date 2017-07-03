//
//  KKBaseNavigationController.m
//  LoveCare
//
//  Created by KaKa on 15/12/7.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseNavigationController.h"

@implementation KKBaseNavigationController
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
@end
