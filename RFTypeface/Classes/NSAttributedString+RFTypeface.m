//
//  NSAttributedString+RFTypeface.m
//  FLEX
//
//  Created by qianjie on 2018/6/4.
//

#import <objc/runtime.h>
#import <RFTypeface/RFTypeface.h>
#import "NSAttributedString+RFTypeface.h"

@implementation NSAttributedString (RFTypeface)

- (RFTypeface *)typeface {
    RFTypeface *typeface = objc_getAssociatedObject(self, _cmd);
    if (!typeface) {
        typeface = [[RFTypeface alloc] init];
        objc_setAssociatedObject(self, _cmd, typeface, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    typeface.attributedString = [self copy];
    return typeface;
}

@end
