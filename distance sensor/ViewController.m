//
//  ViewController.m
//  distance sensor
//
//  Created by EMPty on 3/29/16.
//  Copyright (c) 2016 EMPty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.开启距离传感器（注意：默认情况下，距离传感器是关闭的）
    //只要开启之后，就开始实时监听
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    //2.当监听到有物体靠近设备的时候，系统会发出通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(something:) name:UIDeviceProximityStateDidChangeNotification object:nil];
    
    

}

#pragma mark - 距离传感器变化 ProximityStateDidChange
//监听到物体靠近设备时调用  靠近会屏幕会黑
- (void)something:(NSNotification*) note
{
    NSLog(@"%@",note);
    if([UIDevice currentDevice].proximityState)//YES 是接近
    {
        NSLog(@"有物体接近");
        
    }
    else
    {
        NSLog(@"物体离开");
    }
}


#pragma mark - 注册了监视器，要手动注销
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
