//
//  WaveMathObject.m
//  WaveTest
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WaveMathObject.h"

@implementation WaveMathObject

- (instancetype)init
{
    self = [super init];
    
    if (!self) {
        self = nil;
    }
    
    _shapeLayer = [CAShapeLayer layer];
    _bezierPath = [UIBezierPath bezierPath];
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
