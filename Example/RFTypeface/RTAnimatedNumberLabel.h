//
//  RTAnimatedNumberLabel.h
//  RFTypeface_Example
//
//  Created by qianjie on 2019/6/5.
//  Copyright © 2019 Geph0rce. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSAttributedString *(^RTAnimatedNumberLabelFormatBlock)(CGFloat value);

@interface RTAnimatedNumberLabel : UILabel

@property (nonatomic, assign) CGFloat fromValue;
@property (nonatomic, assign) CGFloat toValue;
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, copy) RTAnimatedNumberLabelFormatBlock formatBlock;


- (void)startAnimation;
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
