//
//  XJDisplayView.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "XJDisplayView.h"

@implementation XJDisplayView{
    __weak UIImageView *_imageView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    
    return self;
}

- (void)reDisplay {
    _imageView.frame = self.bounds;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CoreTextData *data = [XJFrameParser parserContent:_parserConfig.contetText withConfig:_parserConfig];
    CTFrameDraw(data.frame, context);
    CGContextClip(context);// (context, self.bounds);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    _imageView.image = image;
    UIGraphicsEndImageContext();
}

@end
