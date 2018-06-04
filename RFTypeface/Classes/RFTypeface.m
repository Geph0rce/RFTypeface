//
//  RFTypeface.m
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import "RFTypeface.h"

@interface RFTypeface ()

@property (nonatomic, strong) NSMutableDictionary *attributes;
@property (nonatomic, strong) NSMutableParagraphStyle *paragraphStyle;

@end

@implementation RFTypeface


#pragma mark - NSFontAttributeName

- (RFTypeface *(^)(UIFont *font))font {
    return ^id(UIFont *font) {
        if (!font) {
            NSLog(@"font is nil");
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


#pragma mark - NSForegroundColorAttributeName

- (RFTypeface *(^)(UIColor *color))color {
    return ^id(UIColor *color) {
        if (!color) {
            NSLog(@"color is nil");
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

- (RFTypeface *(^)(NSUInteger hex))hex {
    return ^id(NSUInteger hex) {
        NSUInteger red, green, blue;
        blue = hex & 0x0000FF;
        green = ((hex & 0x00FF00) >> 8);
        red = ((hex & 0xFF0000) >> 16);
        return self.rgb(red, green, blue);
    };
}


#pragma mark - NSBaselineOffsetAttributeName

- (RFTypeface *(^)(CGFloat offset))offset {
    return ^id(CGFloat offset) {
        [self.attributes addEntriesFromDictionary:@{ NSBaselineOffsetAttributeName : @(offset) }];
        return self;
    };
}

#pragma mark - NSParagraphStyleAttributeName

- (RFTypeface *(^)(CGFloat lineSpacing))lineSpacing {
    return ^id(CGFloat lineSpacing) {
        self.paragraphStyle.lineSpacing = lineSpacing;
        [self.attributes addEntriesFromDictionary:@{ NSParagraphStyleAttributeName : self.paragraphStyle }];
        return self;
    };
}

- (RFTypeface *(^)(NSLineBreakMode lineBreakMode))lineBreakMode {
    return ^id(NSLineBreakMode lineBreakMode) {
        self.paragraphStyle.lineBreakMode = lineBreakMode;
        [self.attributes addEntriesFromDictionary:@{ NSParagraphStyleAttributeName : self.paragraphStyle }];
        return self;
    };
}

- (RFTypeface *(^)(CGFloat lineHeight))lineHeight {
    return ^id(CGFloat lineHeight) {
        self.paragraphStyle.minimumLineHeight = lineHeight;
        self.paragraphStyle.maximumLineHeight = lineHeight;
        [self.attributes addEntriesFromDictionary:@{ NSParagraphStyleAttributeName : self.paragraphStyle }];
        return self;
    };
}

- (RFTypeface *(^)(CGFloat spacing))kern {
    return ^id(CGFloat spacing) {
        [self.attributes addEntriesFromDictionary:@{ NSKernAttributeName : @(spacing) }];
        return self;
    };
}

- (NSAttributedString *)compose {
    if (self.attributedString.length > 0 && self.attributes.count) {
        NSMutableAttributedString *mutableAttributedString = [self.attributedString mutableCopy];
        [mutableAttributedString addAttributes:self.attributes range:NSMakeRange(0, self.attributedString.length)];
        return mutableAttributedString;
    } else if (self.string.length > 0 && self.attributes.count) {
        return [[NSAttributedString alloc] initWithString:self.string attributes:self.attributes];
    } else if (self.attributedString.length > 0 && !self.attributes.count) {
        return self.attributedString;
    } else if (self.string.length > 0 && !self.attributes.count) {
        return [[NSAttributedString alloc] initWithString:self.string];
    }
    return [[NSAttributedString alloc] init];
}

NSAttributedString *_RFAttributedString(int size,...) {
    va_list vl;
    va_start(vl, size);
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
    for (NSUInteger i = 0; i < size; i++) {
        id string = va_arg(vl, id);
        NSAttributedString *mas = [[NSAttributedString alloc] init];
        if ([string isKindOfClass:[NSAttributedString class]]) {
            mas = string;
        } else if ([string isKindOfClass:[NSString class]]) {
            mas = [[NSAttributedString alloc] initWithString:string];
        }
        [result appendAttributedString:mas];
    }
    return result;
}

#pragma mark - Getters

- (NSMutableDictionary *)attributes {
    if (!_attributes) {
        _attributes = [[NSMutableDictionary alloc] init];
    }
    return _attributes;
}

- (NSMutableParagraphStyle *)paragraphStyle {
    if (!_paragraphStyle) {
        _paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    }
    return _paragraphStyle;
}

@end
