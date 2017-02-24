//
//  KKBaseButton.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseButton.h"
#import <objc/runtime.h>

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

#pragma mark --------------------private--------------------
-(UIImage*)kkButtonImage:(id)arg {
    UIImage* image;
    if ([arg isKindOfClass:[NSString class]]) {
        image = [UIImage imageNamed:(NSString*)arg];
    } else {
        image = (UIImage*)arg;
    }
    return image;
}

-(void)kkButtonImage:(id)arg state:(UIControlState)state {
    [self setImage:[self kkButtonImage:arg] forState:state];
}

-(void)kkButtonBackgroundImage:(id)arg state:(UIControlState)state {
    [self setBackgroundImage:[self kkButtonImage:arg] forState:state];
}

-(void)kkButtonAction:(UIControlEvents)event action:(void (^)(id sender))action{
    KKBaseButtonTarget* target = [[KKBaseButtonTarget alloc] initWithBlock:action];
    [self addTarget:target action:@selector(baseButtonAction:) forControlEvents:event];
    NSPointerArray *targets = [self allUIControlBlockTargets];
    [targets addPointer:(__bridge void * _Nullable)(target)];
}

+(void)addAction:(void (^)(id sender))block button:(KKBaseButton*)button {
    KKBaseButtonTarget* target = [[KKBaseButtonTarget alloc] initWithBlock:block];
    [button addTarget:target action:@selector(baseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    NSPointerArray *targets = [[self class] allUIControlBlockTargets];
    [targets addPointer:(__bridge void * _Nullable)(target)];
}

-(NSPointerArray *)allUIControlBlockTargets {
    NSPointerArray *targets = objc_getAssociatedObject(self, &KKBaseButton_Key);
    if (!targets) {
        targets = [NSPointerArray strongObjectsPointerArray];
        objc_setAssociatedObject(self, &KKBaseButton_Key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

#pragma mark --------------------public--------------------
#pragma mark --------------------链式--------------------
+(instancetype)button {
    return [[self class] buttonWithType:UIButtonTypeCustom];
}

+(instancetype)buttonWithTitle:(NSString *)title {
    KKBaseButton* button = [KKBaseButton button].normalTitle(title);
    return button;
}

+(instancetype)buttonWithDefaultFont:(NSString *)title {
    KKBaseButton* button = [KKBaseButton button].normalTitle(title).titleFont(BUTTON_DEFUALT_FONT);
    return button;
}

+(instancetype)buttonWithImage:(UIImage *)image {
    return [KKBaseButton button].normalImage(image);
}

+(instancetype)buttonWithBackgroundImage:(UIImage *)image {
    return [KKBaseButton button].normalBackgourndImage(image);
}

-(KKBaseButton *(^)(CGRect))buttonFrame {
    return ^KKBaseButton*(CGRect frame){
        self.frame = frame;
        return self;
    };
}

-(KKBaseButton *(^)(NSString *))normalTitle {
    return ^KKBaseButton*(NSString* title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(KKBaseButton *(^)(NSString *))selectTitle {
    return ^KKBaseButton*(NSString* title){
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(KKBaseButton *(^)(UIColor *))normalTitleColor {
    return ^KKBaseButton*(UIColor* color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

-(KKBaseButton *(^)(UIColor *))selectTitleColor {
    return ^KKBaseButton*(UIColor* color){
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

-(KKBaseButton *(^)(UIFont *))titleFont {
    return ^KKBaseButton*(UIFont* font){
        self.titleLabel.font = font;
        return self;
    };
}

-(KKBaseButton *(^)(id))normalImage {
    return ^KKBaseButton*(id arg){
        [self kkButtonImage:arg state:UIControlStateNormal];
        return self;
    };
}

-(KKBaseButton *(^)(id))selectImage {
    return ^KKBaseButton*(id arg){
        [self kkButtonImage:arg state:UIControlStateSelected];
        return self;
    };
}

-(KKBaseButton *(^)(id))normalBackgourndImage {
    return ^KKBaseButton*(id arg){
        [self kkButtonBackgroundImage:arg state:UIControlStateNormal];
        return self;
    };
}

-(KKBaseButton *(^)(id))selectBackgourndImage {
    return ^KKBaseButton*(id arg){
        [self kkButtonBackgroundImage:arg state:UIControlStateSelected];
        return self;
    };
}

-(void)upInsideAction:(void(^)(KKBaseButton *))action {
    [self kkButtonAction:UIControlEventTouchUpInside action:action];
}

-(void)action:(UIControlEvents)event callBack:(void (^)(KKBaseButton *))action {
    [self kkButtonAction:event action:action];
}

#pragma mark --------------------普通方法--------------------
+(instancetype)buttonWithTitle:(NSString *)title actionBlock:(void (^)(KKBaseButton* sender))block {
    KKBaseButton* button = [KKBaseButton buttonWithDefaultFont:title];
    [button kkButtonAction:UIControlEventTouchUpInside action:block];
    return button;
}

+(instancetype)buttonWithImage:(id)image actionBlock:(void (^)(KKBaseButton* sender))block{
    KKBaseButton* button = [KKBaseButton buttonWithImage:image];
    [button kkButtonAction:UIControlEventTouchUpInside action:block];
    return button;
}

+(instancetype)buttonWithImage:(id)image title:(NSString *)title actionBlock:(void (^)(KKBaseButton* sender))block {
    KKBaseButton* button =  [KKBaseButton buttonWithImage:image].normalTitle(title).titleFont(BUTTON_DEFUALT_FONT);
    [button kkButtonAction:UIControlEventTouchUpInside action:block];
    return button;
}

+(instancetype)buttonWithBackgroudImage:(id)image actionBlock:(void (^)(KKBaseButton* sender))block {
    KKBaseButton* button =  [KKBaseButton buttonWithBackgroundImage:image];
    [button kkButtonAction:UIControlEventTouchUpInside action:block];
    return button;
}

+(instancetype)buttonWithBackgroudImage:(id)image title:(NSString *)title actionBlock:(void (^)(KKBaseButton* ))block {
    KKBaseButton* button = [KKBaseButton buttonWithBackgroudImage:image actionBlock:block].normalTitle(title).titleFont(BUTTON_DEFUALT_FONT);
    [button kkButtonAction:UIControlEventTouchUpInside action:block];
    return button;
}

-(void)dealloc {
    objc_removeAssociatedObjects(self);
}

@end
