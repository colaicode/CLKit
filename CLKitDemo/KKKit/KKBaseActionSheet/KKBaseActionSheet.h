//
//  KKBaseActionSheet.h
//  LoveCareProject
//
//  Created by KaKa on 15/12/6.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBaseActionSheet : NSObject

/**
 actionSheet

 @param title 提示文字
 @param buttons buttons
 @param block 回调
 @return actionSheet
 */
+(UIActionSheet* )showActionSheet:(NSString*)title buttons:(NSArray*)buttons complete:(void(^)(NSInteger buttonIndex))block;

@end
