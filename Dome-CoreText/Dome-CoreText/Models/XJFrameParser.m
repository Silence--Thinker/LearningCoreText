//
//  XJFrameParser.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "XJFrameParser.h"

@implementation XJFrameParser

+ (CoreTextData *)parserContent:(NSString *)content withConfig:(XJFrameParserConfig *)config {
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rect;
    CGPathAddRect(path, NULL, rect);
    
    NSMutableAttributedString *attString;
    CTFramesetterRef framesetter;
    CFDictionaryRef style;
    
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, style);
    CoreTextData *textData = [[CoreTextData alloc] init];
    textData.frame = frame;
    return textData;
}

@end
