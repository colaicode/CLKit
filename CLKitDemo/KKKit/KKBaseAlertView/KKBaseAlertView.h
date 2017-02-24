//
//  KKBaseAlertView.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  提示框封装
 */
@interface KKBaseAlertView : NSObject
/**
 *  弹出alert
 *
 *  @param message message
 *  @param buttons 按钮数组
 *  @param block   回调
 */
+(UIAlertView*)showAlert:(NSString*)message buttons:(NSArray*)buttons complete:(void(^)(NSInteger buttonIndex))block;
/**
 *  alert 包含确定按钮
 *
 *  @param message message
 *  @param block   回调
 */
+(void)showAlert:(NSString *)message complete:(void (^)(NSInteger))block;
/**
 *  alert 包含取消和确定按钮
 *
 *  @param message message
 *  @param block   回调
 */
+(void)showSelectAlert:(NSString *)message complete:(void (^)(NSInteger))block;
/**
 *  alert
 *
 *  @param title   名称
 *  @param message 内容
 *  @param buttons 按钮数组
 *  @param block   回调
 */
+(void)showAlertWithTitle:(NSString*)title  message:(NSString*)message buttons:(NSArray*)buttons complete:(void(^)(NSInteger buttonIndex))block;


@end
