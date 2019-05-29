//
//  CoderController.m
//  SecurityInit
//
//  Created  by hong.zhu on 2019/5/29.
//  Copyright © 2019 INC. All rights reserved.
//

#import "CoderController.h"

@interface CoderController ()

// 显示文本控件
@property (weak, nonatomic) IBOutlet UILabel *coderLabel;

// coder 文本
@property (nonatomic, copy) NSString* name;

@end

@implementation CoderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name = @"CoderHG";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 设置 coder
    [self setupCoder];
}

// 设置 coder
- (void)setupCoder {
#ifdef DEBUG
    NSString *coderString = [NSString stringWithFormat:@"DEBUG::%@", self.name];
    self.coderLabel.text = coderString;
#else
    NSString *coderString = [NSString stringWithFormat:@"RELEASE::%@", self.name];
    self.coderLabel.text = coderString;
#endif
}

@end
