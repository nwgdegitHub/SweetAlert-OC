//
//  ViewController.m
//  AlertView
//
//  Created by 刘伟 on 17/1/19.
//  Copyright © 2017年 刘伟. All rights reserved.
//

#import "ViewController.h"
#import "NWGAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NWGAlertView *alertView = [[NWGAlertView alloc]init];
    
    //强制更新
    [alertView creatNWGView:0 withTitle:@"应用程序需要更新啰" andSubTitle:@"版本升级啦，提升用户体验" andClickBlock:^(UIButton *btn) {
        NSLog(@"这里按钮点击回调...");
    }];
    
    //可用更新
    [alertView creatNWGView:1 withTitle:@"应用程序需要更新啰" andSubTitle:@"版本升级啦，提升用户体验" andClickBlock:^(UIButton *btn) {
        NSLog(@"这里按钮点击回调...");
    }];
    
//    //消息提示确认
//    [alertView creatNWGView:2 withTitle:@"应用程序需要更新啰" andSubTitle:@"版本升级啦，提升用户体验" andClickBlock:^(UIButton *btn) {
//        NSLog(@"这里按钮点击回调...");
//    }];
    
    alertView.frame = self.view.bounds;
    [self.view addSubview:alertView];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
