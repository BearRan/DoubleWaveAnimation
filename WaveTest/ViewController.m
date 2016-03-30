//
//  ViewController.m
//  WaveTest
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

//  屏幕宽高
#define WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "ViewController.h"
#import "WaveView.h"

@interface ViewController ()
{
    NSTimer         *_timer1;
    NSTimer         *_timer2;
    WaveView        *_waveView1;
    WaveView        *_waveView2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  _waveView1
    _waveView1 = [[WaveView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 270)];
    _waveView1.fillColor = [[UIColor orangeColor] colorWithAlphaComponent:0.4];
    _waveView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_waveView1];
    
    [self initSetParameter_WaveView1];
    
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01f  //间隔时间
                                               target:_waveView1
                                             selector:@selector(timerEvent)
                                             userInfo:nil
                                              repeats:YES];
    
    
    
    //  _waveView2
    _waveView2 = [[WaveView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 270)];
    _waveView2.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    _waveView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_waveView2];
    
    [self initSetParameter_WaveView2];
    
    _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01f  //间隔时间
                                               target:_waveView2
                                             selector:@selector(timerEvent)
                                             userInfo:nil
                                              repeats:YES];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initSetParameter_WaveView1;
{
    //公式中用到(起始幅度)
    _waveView1.wave = 5.5;
    //起始Y值
    _waveView1.waveHeight = 180;
    //起始频率
    _waveView1.w = 80;
    //起始相位
    _waveView1.b = 0;
    //速度
    _waveView1.waveSpeed = 0.08;
}

- (void)initSetParameter_WaveView2;
{
    //公式中用到(起始幅度)
    _waveView2.wave = 1.5;
    //起始Y值
    _waveView2.waveHeight = 150;
    //起始频率
    _waveView2.w = 80;
    //起始相位
    _waveView2.b = 0;
    //速度
    _waveView2.waveSpeed = 0.05;
}

- (void)timerEvent_WaveView1
{
    [_waveView1 timerEvent];
}

- (void)timerEvent_WaveView2
{
    [_waveView2 timerEvent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
