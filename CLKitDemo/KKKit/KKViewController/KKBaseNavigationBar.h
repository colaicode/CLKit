//
//  KKBaseNavigationBar.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LeftItemBlock)();

@interface KKBaseNavigationBar : UIView
@property (nonatomic, strong)KKBaseLabel*               titleLabel;
@property (nonatomic, strong)KKBaseButton*              leftItem;
@property (nonatomic, strong)KKBaseButton*              rightItem;
@property (nonatomic, strong)NSString*                  title;
@property (nonatomic, copy)LeftItemBlock                leftBlock;
/**
 *  字体颜色
 */
@property (nonatomic, strong)UIColor*                   titleColor;
/**
 *  左侧按钮图片
 */
@property (nonatomic, strong)UIImage*                   leftItemImage;

/**
 *  导航栏背景
 *
 *  @param image 背景图
 */
-(void)backgroundImage:(UIImage*)image;
/**
 *  右侧按钮
 *
 *  @param image 图片
 *  @param block action
 */
-(void)addRightItem:(UIImage*)image action:(void(^)(id sender))block;
/**
 *  右侧按钮
 *
 *  @param title 标题
 *  @param block action
 */
-(void)addRightItemWithTitle:(NSString*)title action:(void(^)(id sender))block;

-(void)addRightItems:(NSArray *)images itemAction:(void (^)(id))block lastItemAction:(void (^)(id))lastBlock;

/**
 *  修改左侧按钮，无图片，默认白色
 *
 *  @param title 标题
 */
-(void)modifyLeftItemWithTitle:(NSString*)title;

/**
 *  显示分割线
 */
-(void)showDivider;

@end
