//
//  RFLabel.h
//  RFTypeface_Example
//
//  Created by qianjie on 2018/12/5.
//  Copyright © 2018 Geph0rce. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RFLabel : UIView

@property (nonatomic, copy) NSAttributedString *attributedText;
@property (nonatomic, assign) NSUInteger numberOfLines;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) CGFloat preferredMaxLayoutWidth;

@property (nonatomic, strong) UIView *customView;

@end

NS_ASSUME_NONNULL_END
