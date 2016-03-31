//
//  WaveCanvasView.m
//  WaveTest
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

//  屏幕宽高
#define WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "WaveCanvasView.h"
#import "WaveView.h"

@interface WaveCanvasView ()
{
    NSTimer         *_timer1;
    NSTimer         *_timer2;
    WaveView        *_waveView1;
    WaveView        *_waveView2;
}
@end

@implementation WaveCanvasView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        self = nil;
    }
    
//    //  _waveView1
//    _waveView1 = [[WaveView alloc] initWithFrame:self.bounds];
//    _waveView1.fillColor = [[UIColor orangeColor] colorWithAlphaComponent:0.4];
//    _waveView1.fillColor = [UIColor colorWithRed:253/255.0 green:183/255.0 blue:180/255.0 alpha:1];
//    _waveView1.backgroundColor = [UIColor clearColor];
//    [self addSubview:_waveView1];
//    
//    [self initSetParameter_WaveView1];
    
    
    //  _waveView2
    _waveView2 = [[WaveView alloc] initWithFrame:self.bounds];
    _waveView2.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    _waveView2.backgroundColor = [UIColor clearColor];
    [self addSubview:_waveView2];
    
    [self initSetParameter_WaveView2];
    
    
    return self;
}


//  initSet

- (void)initSetParameter_WaveView1;
{
    //公式中用到(起始幅度)
    _waveView1.wave = 1.5;
    //起始Y值
    _waveView1.waveHeight = 150;
    //起始频率
    _waveView1.w = 180/375.0 * WIDTH;
    //起始相位
    _waveView1.b = M_PI/2;
    //速度
    _waveView1.waveSpeed = 0.03;
}

- (void)initSetParameter_WaveView2;
{
    //公式中用到(起始幅度)
    _waveView2.wave = 1.5;
    //起始Y值
    _waveView2.waveHeight = 150;
    //起始频率
    _waveView2.w = 180/375.0 * WIDTH;
    //起始相位
    _waveView2.b = 0;
    //速度
    _waveView2.waveSpeed = 0.02;
}


//  start

- (void)startWave1
{
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01f  //间隔时间
                                               target:_waveView1
                                             selector:@selector(timerEvent)
                                             userInfo:nil
                                              repeats:YES];
}

- (void)startWave2
{
    _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01f  //间隔时间
                                               target:_waveView2
                                             selector:@selector(timerEvent)
                                             userInfo:nil
                                              repeats:YES];
}


//  stop

- (void)stopWave1
{
    [_timer1 invalidate];
}

- (void)stopWave2
{
    [_timer2 invalidate];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
