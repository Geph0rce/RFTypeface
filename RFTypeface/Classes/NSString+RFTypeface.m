//
//  NSString+RFTypeface.m
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import <objc/runtime.h>
#import <RFTypeface/RFTypeface.h>
#import "NSString+RFTypeface.h"

@implementation NSString (RFTypeface)

- (RFTypeface *)typeface {
    RFTypeface *typeface = objc_getAssociatedObject(self, _cmd);
    if (!typeface) {
        typeface = [[RFTypeface alloc] init];
        objc_setAssociatedObject(self, _cmd, typeface, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    typeface.string = [self copy];
    return typeface;
}


@end
