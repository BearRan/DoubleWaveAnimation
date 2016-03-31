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
#import "WaveCanvasView.h"
#import "TextView.h"

@interface ViewController ()
{
    WaveCanvasView        *_waveCanvasView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _waveCanvasView = [[WaveCanvasView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 270)];
//    [_waveCanvasView startWave1];
    [_waveCanvasView startWave2];
    [self.view addSubview:_waveCanvasView];
    
    
//    TextView *customView = [[TextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:customView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
