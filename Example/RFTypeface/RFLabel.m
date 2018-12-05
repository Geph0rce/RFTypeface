//
//  RFLabel.m
//  RFTypeface_Example
//
//  Created by qianjie on 2018/12/5.
//  Copyright © 2018 Geph0rce. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "RFLabel.h"

@interface RFLabel ()

@property (nonatomic, strong) NSMutableArray <UILabel *> *labels;
@property (nonatomic, strong) NSMutableArray <NSAttributedString *> *attributedLines;

@end

@implementation RFLabel

- (void)updateConstraints {
    __block UILabel *pre = nil;
    [self.labels enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            if (pre) {
                make.top.mas_equalTo(pre.mas_bottom).offset(self.lineSpacing);
            } else {
                make.top.mas_equalTo(self);
            }
            
            if (self.customView && idx == self.labels.count - 1) {
                make.right.lessThanOrEqualTo(self.customView.mas_left);
            }
        }];
        
        pre = obj;
    }];
    
    if (pre && self.customView) {
        [self.customView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.centerY.mas_equalTo(pre);
        }];
    }
    
    [super updateConstraints];
}

- (void)reloadLabels {
    [self.labels enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.labels removeAllObjects];

    [self.attributedLines enumerateObjectsUsingBlock:^(NSAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] init];
        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        label.attributedText = obj;
        [self addSubview:label];
        [self.labels addObject:label];
        if (self.numberOfLines > 0) {
            *stop = (idx == (self.numberOfLines - 1));
        }
    }];
    

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - Getters and Setters

- (void)setAttributedText:(NSAttributedString *)attributedText {
    if (!attributedText.length) {
        return;
    }
    _attributedText = attributedText.copy;
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) self.attributedText);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.preferredMaxLayoutWidth, CGFLOAT_MAX));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, self.attributedText.length), path, NULL);
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    [self.attributedLines removeAllObjects];
    [lines enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CTLineRef lineRef = (__bridge CTLineRef )obj;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSAttributedString *lineString = [self.attributedText attributedSubstringFromRange:range].typeface.lineBreakMode(NSLineBreakByTruncatingTail).compose;
        [self.attributedLines addObject:lineString];
    }];
    
    [self reloadLabels];

}

- (void)setCustomView:(UIView *)customView {
    [_customView removeFromSuperview];
    _customView = customView;
    [self addSubview:self.customView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setNumberOfLines:(NSUInteger)numberOfLines {
    _numberOfLines = numberOfLines;
    [self reloadLabels];
}


- (NSMutableArray *)labels {
    if (!_labels) {
        _labels = [[NSMutableArray alloc] init];
    }
    return _labels;
}

- (NSMutableArray<NSAttributedString *> *)attributedLines {
    if (!_attributedLines) {
        _attributedLines = [[NSMutableArray alloc] init];
    }
    return _attributedLines;
}

@end
