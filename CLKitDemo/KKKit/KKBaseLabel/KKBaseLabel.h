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
/**
 *  初始化lable font:18
 *
 *  @return label
 */
-(instancetype)initHeadlineLabel;
/**
 *  初始化lable font:14
 *
 *  @return label
 */
-(instancetype)initSubheadlineLable;
/**
 *  初始化lable font:12
 *
 *  @return label
 */
-(instancetype)initBodyLabel;
/**
 *  初始化lable font:10
 *
 *  @return label
 */
-(instancetype)initFootnoteLabel;

@end
