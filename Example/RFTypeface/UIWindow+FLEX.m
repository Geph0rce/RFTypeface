//
//  UIWindow+FLEX.m
//  demo
//
//  Created by qianjie on 2017/11/30.
//  Copyright © 2017年 Zen. All rights reserved.
//

#import "UIWindow+FLEX.h"

#if DEBUG
#import "FLEXManager.h"
#endif

@implementation UIWindow (FLEX)

#if DEBUG
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [super motionBegan:motion withEvent:event];
    
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
        
    }
}
#endif

@end
