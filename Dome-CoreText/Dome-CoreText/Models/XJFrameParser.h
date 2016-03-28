//
//  XJFrameParser.h
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "XJFrameParserConfig.h"

@interface XJFrameParser : NSObject

+ (CoreTextData *)parserContent:(NSString *)content withConfig:(XJFrameParserConfig *)config;

@end
