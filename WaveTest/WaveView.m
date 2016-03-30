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


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat width   = CGRectGetWidth(self.frame);
    CGFloat bottom  = CGRectGetHeight(self.frame);
    float   y1      = _waveHeight;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, _fillColor.CGColor);
    
    CGPathMoveToPoint(path, NULL, 0, y1);
    for (float x = 0; x < CGRectGetWidth(self.frame); x++) {
        y1= _wave * sin( x/_w*M_PI + 4 * _b/M_PI ) * 5 + _waveHeight;
        CGPathAddLineToPoint(path, NULL, x, y1);
    }
    
    CGPathAddLineToPoint(path, NULL, width, bottom);
    CGPathAddLineToPoint(path, NULL, 0, bottom);
    CGPathCloseSubpath(path);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
