//
//  KKBaseViewController.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKBaseNavigationBar.h"
@interface KKBaseViewController : UIViewController
@property (nonatomic, strong)KKBaseNavigationBar*               navigationBar;
/**
 *  开始请求。抽象函数，子类应重写此方法
 */
-(void)startRequest;
/**
 *  抽象函数。重新加载subViews。子类应重写此方法
 */
-(void)reloadView;

-(void)popToViewController;



@end
