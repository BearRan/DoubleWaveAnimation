//
//  WaveMathObject.h
//  WaveTest
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveMathObject : UIView

@property (strong, nonatomic) CAShapeLayer  *shapeLayer;
@property (strong, nonatomic) UIBezierPath  *bezierPath;

//公式中用到(起始幅度)
@property (assign, nonatomic) float wave;
//起始高度，y值
@property (assign, nonatomic) float waveHeight;
//w
@property (assign, nonatomic) float w;
//公式中用到(起始相位)
@property (assign, nonatomic) float b;
//波浪速度
@property (assign, nonatomic) float waveSpeed;

@end
