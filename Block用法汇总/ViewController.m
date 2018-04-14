//
//  ViewController.m
//  Block用法汇总
//
//  Created by weiguang on 2018/4/14.
//  Copyright © 2018年 weiguang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo2];
}


// block外部变量的值
- (void)demo2 {
    
    
    /**
     为什么添加__block就可以修改外部变量的值？
     __block把变量有栈 copy 到堆
     
     可以从打印地址看出来
     Block前：0x7ffeec9929e8
     Block后：0x604000238eb8
     Block中：0x604000238eb8

     栈 空间比较小 2M  1024 * 1024 
     */
    
    __block int a = 10;
    NSLog(@"Block前：%p",&a);
    
    void (^block)(void) = ^{
        
        NSLog(@"Block中：%p",&a);
        a += 10;
        NSLog(@"%d",a);

    };
    NSLog(@"Block后：%p",&a);
    
    block();
}

// block定义和分类
- (void)demo1 {
    // 1. block定义
    // = 等号相当于 copy 把block从栈 复制到 堆
    int a = 10;
    void (^block)(void) = ^{
        
        NSLog(@"%d",a);
        NSLog(@"block");
    };
    
    block();
    
    /**
     2.Block分类
     NSGlobalBlock 全局, 不包含外部变量
     NSMallocBlock 堆, 包含外部变量
     NSStackBlock  栈,
     
     */
    
    NSLog(@"%@",block); // 打印堆Block
    
    /*
     打印栈Block
     NSLog(@"%@",^{
     NSLog(@"%d",a);
     });
     */
    
}



@end
