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
    XJFrameParser *parser = [[XJFrameParser alloc] init];
    XJFrameParserConfig *config = [XJFrameParserConfig new];
    CoreTextData *data = [XJFrameParser parserContent:@"十风六水一二石天木土" withConfig:config];
    self.displayView.textData = data;
}

@end
