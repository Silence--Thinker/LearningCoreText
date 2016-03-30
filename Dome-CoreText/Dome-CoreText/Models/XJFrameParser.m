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
 *
 *
 */
#import "XJFrameParser.h"

@implementation XJFrameParser

+ (CoreTextData *)parserContent:(NSString *)content withConfig:(XJFrameParserConfig *)config {
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rect = CGRectMake(0, 0, 300, 300);
    CGPathAddRect(path, NULL, rect);
    
    NSMutableAttributedString *attString;
    CTFramesetterRef framesetter;
    NSDictionary *styleDict = @{};
    CFDictionaryRef style = (__bridge CFDictionaryRef)(styleDict);
    CFRetain(style);
//    void *p;
//    id s =  (__bridge id)(p);
    NSDictionary *s = (__bridge_transfer id )style;
    CFDictionaryRef *dicttt = (__bridge_retained  void *)styleDict;
    NSDictionary * dddd;
//    dddd = (__bridge_retained  id)dicttt;
    
    void *p1;
    int a = 10;
    int *p2 = &a;
    NSLog(@"%p", p1);
    NSLog(@"%d", (int) *p2);
    p1 = p2;
    NSLog(@"%d", *(int *)p1);
    NSLog(@"%d", (int)* p2);
    
    CFBridgingRelease(style);
    
    attString = [[NSMutableAttributedString alloc] initWithString:content attributes:nil];
    framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    CoreTextData *textData = [[CoreTextData alloc] init];
    textData.frame = frame;
    return textData;
}

@end
