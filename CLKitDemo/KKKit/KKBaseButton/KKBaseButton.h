//
//  KKBaseButton.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  UIButton 基类
 */
@interface KKBaseButton : UIButton
/**
 *  初始化无图片的button font:UIFontTextStyleFootnote
 *
 *  @param title title
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block;
/**
 *  初始化无标题的button
 *
 *  @param image image
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithImage:(UIImage*)image actionBlock:(void (^)(id sender))block;
/**
 *  初始化button
 *
 *  @param image backgroundImage
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithBackgroudImage:(UIImage*)image actionBlock:(void (^)(id sender))block;
/**
 *  初始化按钮
 *
 *  @param image image
 *  @param title 标题
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithImage:(UIImage*)image title:(NSString*)title actionBlock:(void (^)(id sender))block;
/**
 *  初始化按钮
 *
 *  @param image 背景图片
 *  @param title 标题
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithBackgroudImage:(UIImage*)image title:(NSString*)title actionBlock:(void (^)(id sender))block;

@end

