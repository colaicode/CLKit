//
//  KKLabel.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  UILabel 基类
 */
@interface KKBaseLabel : UILabel

-(KKBaseLabel*(^)(NSTextAlignment alignment))labelAlignment;

-(KKBaseLabel*(^)(CGRect frame))labelFrame;

-(KKBaseLabel*(^)(NSInteger num))labelNumOfLines;

-(KKBaseLabel*(^)(NSString* text))labelText;

-(KKBaseLabel*(^)(UIColor* color))labelTextColor;

-(KKBaseLabel*(^)(UIColor* color))labelBgColor;

-(KKBaseLabel*(^)(id font))labelTextFont;

+(instancetype)label;

+(instancetype)labelWithFont:(UIFont*)font;

/**
 *  初始化lable font:18
 *
 *  @return label
 */
+(instancetype)headlineLabel;

/**
 *  初始化lable font:14
 *
 *  @return label
 */
+(instancetype)subheadlineLable;

/**
 *  初始化lable font:12
 *
 *  @return label
 */
+(instancetype)bodyLabel;

/**
 *  初始化lable font:10
 *
 *  @return label
 */
+(instancetype)footnoteLabel;

@end
