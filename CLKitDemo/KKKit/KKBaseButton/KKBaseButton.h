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

+(instancetype)button;

+(instancetype)buttonWithTitle:(NSString*)title;

+(instancetype)buttonWithDefaultFont:(NSString*)title;

+(instancetype)buttonWithImage:(UIImage*)image;

+(instancetype)buttonWithBackgroundImage:(UIImage*)image;

-(KKBaseButton *(^)(CGRect ))buttonFrame;

-(KKBaseButton *(^)(NSString *))normalTitle;

-(KKBaseButton *(^)(NSString *))selectTitle;

-(KKBaseButton *(^)(UIColor *))normalTitleColor;

-(KKBaseButton *(^)(UIColor *))selectTitleColor;

-(KKBaseButton *(^)(UIFont *))titleFont;

-(KKBaseButton *(^)(id))normalImage;

-(KKBaseButton *(^)(id))selectImage;

-(KKBaseButton *(^)(id))normalBackgourndImage;

-(KKBaseButton *(^)(id))selectBackgourndImage;

-(void)upInsideAction:(void(^)(KKBaseButton* sender))action;

-(void)action:(UIControlEvents)event callBack:(void(^)(KKBaseButton* sender))action;

/**
 *  初始化无图片的button fontSize:14
 *
 *  @param title title
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithTitle:(NSString *)title actionBlock:(void (^)(KKBaseButton* sender))block;

/**
 *  初始化无标题的button
 *
 *  @param image image
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithImage:(id)image actionBlock:(void (^)(KKBaseButton* sender))block;

/**
 *  初始化按钮 fontSize:14
 *
 *  @param image image
 *  @param title 标题
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithImage:(id)image title:(NSString*)title actionBlock:(void (^)(KKBaseButton* sender))block;

/**
 *  初始化button
 *
 *  @param image backgroundImage
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithBackgroudImage:(id)image actionBlock:(void (^)(KKBaseButton* sender))block;

/**
 *  初始化按钮
 *
 *  @param image 背景图片
 *  @param title 标题
 *  @param block action
 *
 *  @return button
 */
+(instancetype)buttonWithBackgroudImage:(id)image title:(NSString*)title actionBlock:(void (^)(KKBaseButton* sender))block;

@end

