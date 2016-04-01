//
//  XJDisplayView.h
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreTextData.h"
#import "XJFrameParserConfig.h"
#import "XJFrameParser.h"

@interface XJDisplayView : UIView

@property (nonatomic, strong) XJFrameParserConfig *parserConfig;

- (void)reDisplay;
@end
