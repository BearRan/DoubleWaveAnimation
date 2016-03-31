//
//  WaveView.m
//  WaveTest
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WaveView.h"
#import "WaveMathObject.h"

@interface WaveView ()
{
    
}

@end

@implementation WaveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        self = nil;
    }
    
    return self;
}

- (void)timerEvent
{
    _b += _waveSpeed;
    
    [self setNeedsDisplay];
}


- (void)drawRect1:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat width   = CGRectGetWidth(self.frame);
    CGFloat bottom  = CGRectGetHeight(self.frame);
    float   y1      = _waveHeight;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGContextSaveGState(context);
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(context, 1);
    
    
    
    CGPathMoveToPoint(path, NULL, 0, y1);
    for (float x = 0; x < CGRectGetWidth(self.frame); x++) {
        y1= _wave * sin( x/_w*M_PI + 4 * _b/M_PI ) * 5 + _waveHeight;
        CGPathAddLineToPoint(path, NULL, x, y1);
    }
    
    CGPathAddLineToPoint(path, NULL, width, bottom);
    CGPathAddLineToPoint(path, NULL, 0, bottom);
    CGPathCloseSubpath(path);
    
    
    
    CGContextSetFillColorWithColor(context, _fillColor.CGColor);

    
    
    //第二种填充方式
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (50,90) ,CGPointMake(240,50),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context

//    //实现逐变颜色填充方法 CGContextClip(context);
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
//        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
//        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
//    };
//
//    CGContextSetFillColorSpace(context, rgb);
//
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
//    CGColorSpaceRelease(rgb);
//    CGContextDrawLinearGradient(context, gradient,CGPointMake(0.0,self.frame.size.height) ,CGPointMake(self.frame.size.width,self.frame.size.height),kCGGradientDrawsAfterEndLocation);

//    CGGradientRelease(gradient);
////    CGContextSetFillColorWithColor(context, _fillColor.CGColor);
//    
//    
//    
//    
//    CGContextAddPath(context, path);
//    CGContextFillPath(context);
////    CGContextDrawPath(context, kCGPathStroke);
//    CGPathRelease(path);

}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    
    CGFloat width   = CGRectGetWidth(self.frame);
    CGFloat bottom  = CGRectGetHeight(self.frame);
    float   y1      = _waveHeight;

    CGContextMoveToPoint(context, 0, y1);
    for (float x = 0; x < CGRectGetWidth(self.frame); x++) {
        y1= _wave * sin( x/_w*M_PI + 4 * _b/M_PI ) * 5 + _waveHeight;
        CGContextAddLineToPoint(context, x, y1);
    }
    
    CGContextAddLineToPoint(context, width, bottom);
    CGContextAddLineToPoint(context, 0, bottom);
    
    
    //context裁剪路径,后续操作的路径
    CGContextClip(context);
    CGContextDrawLinearGradient(context,
                                gradient,
                                CGPointMake(0.0,0.0),
                                CGPointMake(self.frame.size.width,0.0),
                                kCGGradientDrawsBeforeStartLocation);
    
    // 恢复到之前的context
    CGContextRestoreGState(context);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
