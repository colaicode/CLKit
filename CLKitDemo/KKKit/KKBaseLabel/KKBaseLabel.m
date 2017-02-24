//
//  KKLabel.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseLabel.h"

#define LABEL_DEFAULT_COLOR            [UIColor whiteColor]

@implementation KKBaseLabel

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfLines = 0;
        self.textAlignment = NSTextAlignmentCenter;
        self.lineBreakMode = NSLineBreakByTruncatingTail;
        self.textColor = LABEL_DEFAULT_COLOR;
    }
    return self;
}

-(instancetype)initHeadlineLabel
{
    self = [self init];
    if (self) {
        self.font = [UIFont systemFontOfSize:18];
    }
    return self;
}

-(instancetype)initSubheadlineLable
{
    self = [self init];
    if (self) {
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

-(instancetype)initBodyLabel
{
    self = [self init];
    if (self) {
        self.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

-(instancetype)initFootnoteLabel
{
    self = [self init];
    if (self) {
        self.font = [UIFont systemFontOfSize:10];
    }
    return self;
}

@end
