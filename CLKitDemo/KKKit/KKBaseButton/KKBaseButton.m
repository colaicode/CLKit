//
//  KKBaseButton.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseButton.h"
#import <objc/runtime.h>

#define BUTTON_DEFAULT_COLOR            [UIColor blackColor]
#define BUTTON_DEFUALT_FONT             [UIFont systemFontOfSize:14]

@interface KKBaseButtonTarget : NSObject
-(instancetype)initWithBlock:(void (^)(id sender))block;

-(void)baseButtonAction:(id)sender;
@end

@interface KKBaseButtonTarget ()
@property (nonatomic, copy)void(^KKBaseButtonTargetBlock)(id sender);
@end

@implementation KKBaseButtonTarget

-(instancetype)initWithBlock:(void (^)(id))block {
    self = [super init];
    if (self) {
        _KKBaseButtonTargetBlock = block;
    }
    return self;
}

-(void)baseButtonAction:(id)sender {
    if(_KKBaseButtonTargetBlock) _KKBaseButtonTargetBlock(sender);
}

@end

static const NSString* KKBaseButton_Key = @"KKBaseButtonKey";

@interface KKBaseButton ()
@end

@implementation KKBaseButton

+(instancetype)buttonWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block {
    KKBaseButton* button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:BUTTON_DEFAULT_COLOR forState:UIControlStateNormal];
    button.titleLabel.font = BUTTON_DEFUALT_FONT;
    [[self class] addAction:block button:button];
    return button;
}

+(instancetype)buttonWithBackgroudImage:(UIImage *)image actionBlock:(void (^)(id sender))block {
    KKBaseButton* button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [[self class] addAction:block button:button];
    button.titleLabel.font = BUTTON_DEFUALT_FONT;
    return button;
}

+(instancetype)buttonWithImage:(UIImage *)image actionBlock:(void (^)(id sender))block{
    KKBaseButton* button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    button.titleLabel.font = BUTTON_DEFUALT_FONT;
    [[self class] addAction:block button:button];
    return button;
}

+(instancetype)buttonWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(id sender))block {
    KKBaseButton* button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = BUTTON_DEFUALT_FONT;
    [[self class] addAction:block button:button];
    return button;
}

+(instancetype)buttonWithBackgroudImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(id sender))block {
    KKBaseButton* button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = BUTTON_DEFUALT_FONT;
    [[self class] addAction:block button:button];
    return button;
}

+(void)addAction:(void (^)(id sender))block button:(KKBaseButton*)button {
    KKBaseButtonTarget* target = [[KKBaseButtonTarget alloc] initWithBlock:block];
    [button addTarget:target action:@selector(baseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    NSPointerArray *targets = [[self class] allUIControlBlockTargets];
    [targets addPointer:(__bridge void * _Nullable)(target)];
}

+(NSPointerArray *)allUIControlBlockTargets {
    NSPointerArray *targets = objc_getAssociatedObject(self, &KKBaseButton_Key);
    if (!targets) {
        targets = [NSPointerArray strongObjectsPointerArray];
        objc_setAssociatedObject(self, &KKBaseButton_Key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

-(void)dealloc {
    objc_removeAssociatedObjects(self);
}

@end
