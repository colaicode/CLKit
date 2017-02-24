//
//  KKBaseAlertView.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseAlertView.h"
#import <objc/runtime.h>

static const NSString* BaseAlert_Key = @"BaseAlertKey";

#define DEFAULT_ALERTVIEW_INFO_TEXT                   @"提示"
#define DETAULT_ALERTVIEW_CONFIRM_TEXT                @"确定"
#define DETAULT_ALERTVIEW_CANCEL_TEXT                 @"取消"

@interface KKBaseAlertView ()<UIAlertViewDelegate>
@property (nonatomic, copy)void(^KKBaseAlertViewBlock)(NSInteger buttonIndex);
@end

@implementation KKBaseAlertView

+(UIAlertView*)showAlert:(NSString *)message buttons:(NSArray *)buttons complete:(void (^)(NSInteger))block {
    KKBaseAlertView* baseView = [self new];
    if(block) {
        baseView.KKBaseAlertViewBlock = block;
    }
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:DEFAULT_ALERTVIEW_INFO_TEXT message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [alert addButtonWithTitle:obj];
    }];
    [alert setDelegate:baseView];
    objc_setAssociatedObject(alert.delegate, &BaseAlert_Key, baseView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [alert show];
    return alert;
}

+(void)showAlert:(NSString *)message complete:(void (^)(NSInteger))block {
    [[self class] showAlert:message buttons:@[DETAULT_ALERTVIEW_CONFIRM_TEXT] complete:block];
}

+(void)showSelectAlert:(NSString *)message complete:(void (^)(NSInteger))block {
    [[self class] showAlert:message buttons:@[DETAULT_ALERTVIEW_CONFIRM_TEXT,DETAULT_ALERTVIEW_CANCEL_TEXT] complete:block];
}

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons complete:(void (^)(NSInteger))block {
    KKBaseAlertView* baseView = [self new];
    if(block) {
        baseView.KKBaseAlertViewBlock = block;
    }
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [alert addButtonWithTitle:obj];
    }];
    [alert setDelegate:baseView];
    objc_setAssociatedObject(alert.delegate, &BaseAlert_Key, baseView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [alert show];

}

#pragma mark --------------- UIAlertViewDelegate ---------------
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    KKBaseAlertView* handler = objc_getAssociatedObject(alertView.delegate, &BaseAlert_Key);
    if (handler.KKBaseAlertViewBlock)
        handler.KKBaseAlertViewBlock(buttonIndex);
    objc_removeAssociatedObjects(alertView.delegate);
}


@end
