# BlockDemo
Block 用法汇总

>为什么添加__block就可以修改外部变量的值？
__block把变量从栈 copy 到堆

```
__block int a = 10;
    NSLog(@"Block前：%p",&a);
    
    void (^block)(void) = ^{
        
        NSLog(@"Block中：%p",&a);
        a += 10;
        NSLog(@"%d",a);

    };
    NSLog(@"Block后：%p",&a);
    
    block();
```
     
     可以从打印地址看出来
     Block前：0x7ffeec9929e8
     Block后：0x604000238eb8
     Block中：0x604000238eb8
>2.Block分类
     NSGlobalBlock 全局, 不包含外部变量
     NSMallocBlock 堆, 包含外部变量
     NSStackBlock  栈,


