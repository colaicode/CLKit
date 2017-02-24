//
//  KKLabel.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseLabel.h"

@implementation KKBaseLabel

-(instancetype)init {
    self = [super init];
    if (self) {
        self.labelNumOfLines(0).labelAlignment(NSTextAlignmentCenter);
    }
    return self;
}

-(KKBaseLabel *(^)(NSTextAlignment))labelAlignment {
    return ^KKBaseLabel*(NSTextAlignment al){
        self.textAlignment = al;
        return self;
    };
}

-(KKBaseLabel *(^)(CGRect))labelFrame {
    return ^KKBaseLabel*(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(KKBaseLabel *(^)(NSInteger))labelNumOfLines {
    return ^KKBaseLabel*(NSInteger num){
        self.numberOfLines = num;
        return self;
    };
}

-(KKBaseLabel *(^)(NSString *))labelText {
    return ^KKBaseLabel*(NSString* text){
        self.text = text;
        return self;
    };
}

-(KKBaseLabel *(^)(UIColor *))labelTextColor {
    return ^KKBaseLabel*(UIColor* color){
        self.textColor = color;
        return self;
    };
}

-(KKBaseLabel *(^)(UIColor *))labelBgColor {
    return ^KKBaseLabel*(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}

-(KKBaseLabel *(^)(UIFont *))labelTextFont {
    return ^KKBaseLabel*(UIFont *font){
        self.font = font;
        return self;
    };
}

+(instancetype)label {
    return [[[self class] alloc] init];
}

+(instancetype)labelWithFont:(UIFont *)font {
    KKBaseLabel* label = [[self class] label];
    label.font = font;
    return label;
}

+(instancetype)headlineLabel {
    return [[self class] labelWithFont:[UIFont systemFontOfSize:18]];
}

+(instancetype)subheadlineLable {
    return [[self class] labelWithFont:[UIFont systemFontOfSize:14]];
}

+(instancetype)bodyLabel {
    return [[self class] labelWithFont:[UIFont systemFontOfSize:12]];
}

+(instancetype)footnoteLabel {
    return [[self class] labelWithFont:[UIFont systemFontOfSize:10]];
}


@end
