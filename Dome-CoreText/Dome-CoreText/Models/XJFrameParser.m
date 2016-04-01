//
//  XJFrameParser.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

/**
 * 1、__bridge:桥接 
 *  Core Foundation.framework:
 *      是一套C语言框架，由于OC是C语言的基础上的提升，所以，保留了很多C的元素
 *      在Core Text.framework中很多涉及C的语法和用法
 *  Foundation.framework:
 *      是一套OC语言的框架
 *  __bridge的作用主要是：
 *      将Foundation框架（OC）中的对象，转化为Core Foundation中的类型，或者
 *      将Core Foundation中的类型转化为Foundation中对象。
 * 2、__bridge_transfer
 *
 * 3、__bridge_retained
 */
#import "XJFrameParser.h"

@implementation XJFrameParser

+ (CoreTextData *)parserContent:(NSString *)content
                     withConfig:(XJFrameParserConfig *)config {
    // 得到 attString
    NSDictionary *styleDict = [self stringAttributeWith:config];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:content attributes:styleDict];
    
    // 创建 CTFramesetterRef
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    
    // 计算 绘制文字的高度
    CGSize boundSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), NULL, boundSize, NULL);
    CGFloat textFitHeight = fitSize.height;
    // 创建 CTFrameRef
    CTFrameRef frame = [self frameWithFramesetter:framesetter
                                       withConfig:config
                                           height:textFitHeight];
    CoreTextData *textData = [CoreTextData new];
    textData.frame = frame;
    
    CFRelease(frame);
    CFRelease(framesetter);
    return textData;
}

+ (NSDictionary *)stringAttributeWith:(XJFrameParserConfig *)config {
    
    CFIndex fontSize = config.textFont.pointSize;
    NSString *fontName = config.textFont.fontName;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)fontName, fontSize, NULL);
    CGFloat lineSpacing = config.lineSpacing;
    CTTextAlignment alignment = NSTextAlignmentToCTTextAlignment(config.alignment);
    CTParagraphStyleSetting stylesetting[] = {
        { kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierAlignment, sizeof(char), &alignment}
    };
    const CFIndex count = 4;
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(stylesetting, count);
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[(id)kCTParagraphStyleAttributeName]       =   (__bridge id)paragraphStyle;
    dictM[(id)kCTForegroundColorAttributeName]      =   (__bridge id)config.textColor.CGColor;
    dictM[(id)kCTFontAttributeName]                 =   (__bridge id)fontRef;
    
    CFRelease(paragraphStyle);
    CFRelease(fontRef);
    return dictM;
}

+ (CTFrameRef)frameWithFramesetter:(CTFramesetterRef)framesetter
                        withConfig:(XJFrameParserConfig *)config
                            height:(CGFloat)height {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rect = CGRectMake(0, 0, config.width, height);
    CGPathAddRect(path, NULL, rect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    
    CFRelease(path);
    return frame;
}

@end
