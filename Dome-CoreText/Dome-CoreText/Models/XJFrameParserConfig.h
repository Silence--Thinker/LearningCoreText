//
//  XJFrameParserConfig.h
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, copy) NSString *contetText;
@end
