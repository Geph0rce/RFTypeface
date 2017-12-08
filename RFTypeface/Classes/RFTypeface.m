//
//  RFTypeface.m
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import <RFFoundation/RFFoundation.h>
#import "RFTypeface.h"

@interface RFTypeface ()

@property (nonatomic, strong) NSMutableDictionary *attributes;

@end

@implementation RFTypeface

- (RFTypeface *(^)(UIFont *font))font {
    return ^id(UIFont *font) {
        guard (font) else {
            DLog(@"font is nil");
            return self;
        }
        [self.attributes addEntriesFromDictionary:@{ NSFontAttributeName : font }];
        return self;
    };
}

- (RFTypeface *(^)(CGFloat fontSize))normal {
    return ^id(CGFloat fontSize) {
        return self.font([UIFont systemFontOfSize:fontSize]);
    };
}

- (RFTypeface *(^)(CGFloat fontSize))bold {
    return ^id(CGFloat fontSize) {
        return self.font([UIFont boldSystemFontOfSize:fontSize]);
    };
}

- (RFTypeface *(^)(UIColor *color))color {
    return ^id(UIColor *color) {
        guard(color) else {
            DLog(@"color is nil");
            return self;
        }
        [self.attributes addEntriesFromDictionary:@{ NSForegroundColorAttributeName : color }];
        return self;
    };
}
- (RFTypeface *(^)(CGFloat red, CGFloat green, CGFloat blue))rgb {
    return ^id(CGFloat red, CGFloat green, CGFloat blue) {
        UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];

        return self.color(color);
    };
}

- (RFTypeface *(^)(NSUInteger hexValue))hex {
    return ^id(NSUInteger hexValue) {
        NSUInteger red, green, blue;
        blue = hexValue & 0x0000FF;
        green = ((hexValue & 0x00FF00) >> 8);
        red = ((hexValue & 0xFF0000) >> 16);
        return self.rgb(red, green, blue);
    };
}

- (NSAttributedString *)build {
    guard (self.string.length > 0) else {
        DLog(@"self.string is nil");
        return [[NSAttributedString alloc] init];
    }
    
    guard (self.attributes.count > 0) else {
        DLog(@"self.attributes is empty, nothing to build");
        return [[NSAttributedString alloc] initWithString:self.string];
    }
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:self.string attributes:self.attributes];
    return string;
}


#pragma mark - Getters

- (NSMutableDictionary *)attributes {
    if (!_attributes) {
        _attributes = [[NSMutableDictionary alloc] init];
    }
    return _attributes;
}

@end
