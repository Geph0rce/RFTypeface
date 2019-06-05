//
//  RTAnimatedNumberLabel.m
//  RFTypeface_Example
//
//  Created by qianjie on 2019/6/5.
//  Copyright © 2019 Geph0rce. All rights reserved.
//

#import "RTAnimatedNumberLabel.h"

@interface RTAnimatedNumberLabel ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat step;
@property (nonatomic, assign) CGFloat currentValue;

@end

@implementation RTAnimatedNumberLabel


#pragma mark - CADisplayLink Callback

- (void)updateDisplay:(CADisplayLink *)displayLink {
    self.currentValue += self.step;
    if (self.currentValue >= self.toValue) {
        [self stopAnimation];
    }
    
    CGFloat value = MIN(self.currentValue, self.toValue);
    guard (self.formatBlock) else {
        DLog(@"missing formatBlock");
        return;
    }
    self.attributedText = self.formatBlock(value);
}

#pragma mark - Animation

- (void)startAnimation {
    // step & current value
    CGFloat duation = self.duration > 0 ?: 1.0;
    self.step = fabs(self.toValue - self.fromValue) / duation * 60.0;
    self.currentValue = self.fromValue;
    
    // rock 'n' roll
    [self stopAnimation];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopAnimation {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - Getters

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    }
    return _displayLink;
}



@end
