//
//  ViewController.m
//  GCD中的同步和异步
//
//  Created by 陈高健 on 15/11/26.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//点击屏幕的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //异步
    [self asyncMethod];
    //同步
    //[self syncMethod];
    
}

//异步的时候调用
- (void)asyncMethod{
    //获取全局队列
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    //创建任务
    void(^task)()=^{
        NSLog(@"asyncMethod:%@",[NSThread currentThread]);
    };
    //执行任务
    dispatch_async(queue, task);
    
    NSLog(@"程序结束");
}

//同步的时候调用
- (void)syncMethod{
    //获取全局队列
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    //创建任务
    void(^task)()=^{
        NSLog(@"syncMethod:%@",[NSThread currentThread]);
    };
    //执行任务
    dispatch_sync(queue, task);
    
    NSLog(@"程序结束");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
