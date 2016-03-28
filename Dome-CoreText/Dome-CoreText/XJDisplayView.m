//
//  XJDisplayView.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "XJDisplayView.h"
#import <CoreText/CoreText.h>

@implementation XJDisplayView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 1、获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2、翻转坐标系位置
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);// -1.0导致翻转
    
    // 3、创建绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
//    CGPathAddEllipseInRect(path, NULL, self.bounds);// 椭圆
//    CGPathAddArc(path, NULL, self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.height/2-40, 0, M_PI *2, NO);// 完整的圆...
    
    // 4、使用CoreText进行绘制文字
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"对于参与投资的企业，罗辑思维和Pap酱方面也做了相关的资质限制，制定了相应的门槛，如：注册资金实缴300万，保证金100万。而烟草、白酒、P2P金融、药品、保健食品、医疗器械等目前有争议的企业，则被排斥在招标范围。现场有P2P企业提问，对于P2P企业无法入选无法理解，而罗振宇在解释时则强调一旦标王出事，受损害的是招标平台罗辑思维和Papi酱本身，鉴于目前P2P行业目前一些负面新闻较多的情况，因此采取相对谨慎的做法,相关的资质限制，制定了相应的门槛，如：注册资金实缴300万，保证金100万。而烟草、白酒、P2P金融、药品、保健食品、医疗器械等目前有争议的企业，则被排斥在招标范围。现场有"];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    CTFrameDraw(frame, context);
    
    // 5、释放资源
    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(path);
}

@end
