//
//  KKBaseNavigationBar.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseNavigationBar.h"
#import "Masonry.h"

#define NAV_ITEM_WIDTH     40

#define TOP_PADDING        20

@interface KKBaseNavigationBar ()
@end

@implementation KKBaseNavigationBar

-(instancetype)init{
    self = [super init];
    if (self) {
        
        __weak __typeof(self) weakSelf = self;
        NSString* path = [[NSBundle mainBundle] pathForResource:@"KKKit" ofType:@"bundle"];
        NSString* imagePath = [[NSBundle bundleWithPath:path] pathForResource:@"back" ofType:@"png" inDirectory:@"image"];
        NSLog(@"%@",imagePath);
        _leftItem = [KKBaseButton buttonWithImage:imagePath actionBlock:^(KKBaseButton*sender){
            weakSelf.leftBlock();
        }];
        _leftItem.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [self addSubview:_leftItem];
        
        _titleLabel = [KKBaseLabel headlineLabel];
        [self addSubview:_titleLabel];
        [_leftItem mas_makeConstraints:^(MASConstraintMaker* maker){
            maker.left.bottom.equalTo(self);
            maker.top.mas_equalTo(20);
            maker.width.mas_equalTo(40);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker* maker){
            maker.left.greaterThanOrEqualTo(weakSelf.leftItem.mas_right);
            maker.top.equalTo(weakSelf.leftItem.mas_top);
            maker.centerX.equalTo(weakSelf.mas_centerX);
            maker.height.equalTo(weakSelf.leftItem.mas_height);
        }];
    }
    return self;
}

-(void)backgroundImage:(UIImage *)image {
    self.layer.contents = (id)image.CGImage;
}

-(void)addRightItem:(UIImage *)image action:(void (^)(id))block {
    __weak __typeof(self) weakSelf = self;
    _rightItem = [KKBaseButton buttonWithImage:image actionBlock:block];
    _rightItem.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    [self addSubview:_rightItem];
    [_rightItem mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.top.width.height.equalTo(weakSelf.leftItem);
        maker.right.equalTo(weakSelf);
    }];
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker* maker){
        maker.right.lessThanOrEqualTo(_rightItem.mas_left);
    }];
}

-(void)addRightItemWithTitle:(NSString *)title action:(void (^)(id))block {
    __weak __typeof(self) weakSelf = self;
    _rightItem = [KKBaseButton buttonWithTitle:title actionBlock:block];
    _rightItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [_rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_rightItem];
    [_rightItem mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.top.height.equalTo(weakSelf.leftItem);
        maker.right.equalTo(weakSelf);
        maker.width.mas_greaterThanOrEqualTo(NAV_ITEM_WIDTH);
    }];
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker* maker){
        maker.right.lessThanOrEqualTo(_rightItem.mas_left);
    }];
}

-(void)addRightItems:(NSArray *)images itemAction:(void (^)(id))block lastItemAction:(void (^)(id))lastBlock {
    KKBaseButton* item = [KKBaseButton buttonWithImage:images[0] actionBlock:block];
    [self addSubview:item];
    KKBaseButton* lastItem = [KKBaseButton buttonWithImage:images[1] actionBlock:lastBlock];
    [self addSubview:lastItem];
    
    [lastItem mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.top.height.equalTo(self.leftItem);
        maker.right.equalTo(self.mas_right);
        maker.width.mas_equalTo(NAV_ITEM_WIDTH);
    }];

    [item mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.width.top.height.equalTo(lastItem);
        maker.right.equalTo(lastItem.mas_left);
    }];
}

-(void)modifyLeftItemWithTitle:(NSString *)title {
    [_leftItem setImage:nil forState:UIControlStateNormal];
    [_leftItem setTitle:title forState:UIControlStateNormal];
}

-(void)showDivider {
    UIView* line = [UIView new];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.equalTo(self);
        maker.bottom.equalTo(self.mas_bottom);
        maker.height.equalTo(@.6);
    }];
}

#pragma mark --------------------- set && get ---------------------
-(void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = title;
}

-(void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    _titleLabel.textColor = titleColor;
}

-(void)setLeftItemImage:(UIImage *)leftItemImage {
    _leftItemImage = leftItemImage;
    [_leftItem setImage:_leftItemImage forState:UIControlStateNormal];
    _leftItem.titleLabel.font = [UIFont systemFontOfSize:15];
    [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}

@end
