//
//  XJFrameParserConfig.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "XJFrameParserConfig.h"

@implementation XJFrameParserConfig
- (instancetype)init {
    if (self = [super init]) {
        self.textFont = [UIFont fontWithName:@"Helvetica" size:15];
        self.textColor = [UIColor redColor];
        self.width = [UIScreen mainScreen].bounds.size.width;
        self.lineSpacing = 10.5;
        self.alignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
