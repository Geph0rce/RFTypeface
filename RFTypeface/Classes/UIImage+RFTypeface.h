//
//  UIImage+RFTypeface.h
//  FLEX
//
//  Created by Roger on 2018/8/30.
//

#import <UIKit/UIKit.h>

@interface UIImage (RFTypeface)

+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

- (NSAttributedString *)attributedString;

- (NSTextAttachment *)attachment;

@end
