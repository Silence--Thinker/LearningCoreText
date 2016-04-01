//
//  CoreTextData.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData

- (void)setFrame:(CTFrameRef)frame {
    if (_frame != frame) {
        if (_frame) {
            CFRelease(_frame);
        }
        CFRetain(frame);
        _frame = frame;
    }
}

@end
