//
//  WaveCanvasView.h
//  WaveTest
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveCanvasView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

//  start
- (void)startWave1;
- (void)startWave2;

//  stop
- (void)stopWave1;
- (void)stopWave2;

@end
