//
//  CoderController.m
//  SecurityInit
//
//  Created  by hong.zhu on 2019/5/29.
//  Copyright © 2019 INC. All rights reserved.
//

#import "CoderController.h"


//NSString *const UCARID = @"UCARID_8968";

#define UCARID  @"UCARID_8968"

// https://github.com/HikariObfuscator/Hikari/wiki/Usage
// 一旦标注, 当前方法中的字符串都被混淆
// 每次混淆的结果是一样的
// 字符串加密
extern void hikari_strenc(void);
//
extern void hikari_fla(void);
extern void hikari_bcf(void);
extern void hikari_fco(void);
extern void hikari_fw(void);


/**
-mllvm -enable-bcfobf     启用伪控制流
-mllvm -enable-cffobf     启用控制流平坦化
-mllvm -enable-splitobf   启用基本块分割
-mllvm -enable-subobf     启用指令替换
-mllvm -enable-acdobf     启用反class-dump
-mllvm -enable-indibran   启用基于寄存器的相对跳转，配合其他加固可以彻底破坏IDA/Hopper的伪代码(俗称F5)
-mllvm -enable-strcry     启用字符串加密
-mllvm -enable-funcwra    启用函数封装
-mllvm -enable-allobf     依次性启用上述所有标记
*/

@interface CoderController ()

// 显示文本控件
@property (weak, nonatomic) IBOutlet UILabel *coderLabel;

// coder 文本
@property (nonatomic, copy) NSString* name;

@end

@implementation CoderController


// __attribute((__annotate__(("strenc"))))

//__attribute((__annotate__(("fw"))))
__attribute((__annotate__(("strenc"))))
void test(void) {
    NSLog(@"CoderHG123");
    
    NSLog(@"CoderHG321");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    test();
    [self nilTest];
}

- (void)nilTest {
    hikari_strenc();

    
    self.name = @"CodernilTest";
    
    
    NSLog(@"来呀, 快乐啊! %@", UCARID);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    hikari_fw();
    // 设置 coder
    [self setupCoder];
}

// 设置 coder
- (void)setupCoder {
    // 混淆标识
    // hikari_strenc();
    // hikari_fw();
    
    // 字符串
    self.name = @"CoderINC";
    
#ifdef DEBUG
    NSString *coderString = [NSString stringWithFormat:@"DEBUG::%@", self.name];
    self.coderLabel.text = coderString;
#else
    NSString *coderString = [NSString stringWithFormat:@"RELEASE::%@", self.name];
    self.coderLabel.text = coderString;
#endif
    
    self.name = @"CoderEND";
}


// 设置 coder
- (void)setupCoder123 {
    // 混淆标识
    hikari_strenc();
    
    // 字符串
    self.name = @"CoderINC";
    
#ifdef DEBUG
    NSString *coderString = [NSString stringWithFormat:@"DEBUG::%@", self.name];
    self.coderLabel.text = coderString;
#else
    NSString *coderString = [NSString stringWithFormat:@"RELEASE::%@", self.name];
    self.coderLabel.text = coderString;
#endif
    
    self.name = @"CoderEND";
}


@end
