//
//  ViewController.m
//  Dome-CoreText
//
//  Created by Silence on 16/3/28.
//  Copyright © 2016年 ___SILENCE___. All rights reserved.
//

#import "ViewController.h"
#import "XJDisplayView.h"
#import "XJFrameParser.h"

@interface ViewController ()

@property (nonatomic, weak) XJDisplayView *displayView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    XJDisplayView *displayView = [[XJDisplayView alloc] init];
    displayView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    displayView.center = self.view.center;
    
    [self.view addSubview:displayView];
    self.displayView = displayView;
    
    
    // 设置
    XJFrameParserConfig *config = [XJFrameParserConfig new];
    config.contetText = @"十风六水一二石天木土@各位男童鞋，为了让卫生间的马桶使用寿命更长，请将用过的卫生纸丢到纸篓里！请将用过的卫生纸丢到纸篓里！请将用过的卫生纸丢到纸篓里！ 重要的事情说三遍！！！";
    self.displayView.parserConfig = config;
    [self.displayView reDisplay];

}
@end
