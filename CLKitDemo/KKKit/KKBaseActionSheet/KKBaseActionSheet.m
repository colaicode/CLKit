//
//  KKBaseActionSheet.m
//  LoveCareProject
//
//  Created by KaKa on 15/12/6.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseActionSheet.h"
#import <objc/runtime.h>
static const NSString* BaseActionSheet_Key = @"BaseActionSheetKey";


@interface KKBaseActionSheet ()<UIActionSheetDelegate>
@property (nonatomic, copy)void(^KKBaseActionSheetBlock)(NSInteger buttonIndex);

@end

@implementation KKBaseActionSheet

+(void)showActionSheet:(NSString *)title buttons:(NSArray *)buttons complete:(void (^)(NSInteger))block {
    KKBaseActionSheet* baseView = [self new];
    if (block) {
        baseView.KKBaseActionSheetBlock = block;
    }
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    [actionSheet setDelegate:baseView];
    [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [actionSheet addButtonWithTitle:obj];
    }];
    [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    objc_setAssociatedObject(actionSheet.delegate, &BaseActionSheet_Key, baseView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    KKBaseActionSheet* handler = objc_getAssociatedObject(actionSheet.delegate, &BaseActionSheet_Key);
    if (handler.KKBaseActionSheetBlock)
        handler.KKBaseActionSheetBlock(buttonIndex);
    objc_removeAssociatedObjects(actionSheet.delegate);
}


@end
