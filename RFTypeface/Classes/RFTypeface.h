//
//  RFTypeface.h
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import <RFTypeface/NSString+RFTypeface.h>
#import <RFTypeface/NSAttributedString+RFTypeface.h>

#define RFAttributedString(...) _RFAttributedString(metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

NSAttributedString *_RFAttributedString(int size,...);

@interface RFTypeface : NSObject

@property (nonatomic, copy) NSString *string;
@property (nonatomic, copy) NSAttributedString *attributedString;


/**
 NSFontAttributeName
 */
- (RFTypeface *(^)(CGFloat fontSize))normal;
- (RFTypeface *(^)(CGFloat fontSize))bold;
- (RFTypeface *(^)(UIFont *font))font;


/**
 NSForegroundColorAttributeName
 */
- (RFTypeface *(^)(UIColor *color))color;
- (RFTypeface *(^)(CGFloat red, CGFloat green, CGFloat blue))rgb;
- (RFTypeface *(^)(NSUInteger hex))hex;


/**
 NSBackgroundColorAttributeName
 */
- (RFTypeface *(^)(UIColor *color))background;

/**
 NSBaselineOffsetAttributeName
 offset > 0 move up, offset < 0 move down
 */
- (RFTypeface *(^)(CGFloat offset))offset;

/**
 NSParagraphStyleAttributeName
 lineSpace of string
 */
- (RFTypeface *(^)(CGFloat lineSpacing))lineSpacing;

/**
 NSParagraphStyleAttributeName
 lineBreakMode of string
 */
- (RFTypeface *(^)(NSLineBreakMode lineBreakMode))lineBreakMode;


/**
 NSParagraphStyleAttributeName
 lineHeight of string
 */
- (RFTypeface *(^)(CGFloat lineHeight))lineHeight;

/**
 NSParagraphStyleAttributeName
 first line head indent of string
 */
- (RFTypeface *(^)(CGFloat indent))firstLineHeadIndent;

/**
 NSKernAttributeName
 spacing between letters
 */
- (RFTypeface *(^)(CGFloat spacing))kern;


/**
 add all attributes on the chain to the string

 @return return string with attributes on the chain
 */
- (NSAttributedString *)compose;


/**
 single line text size
 
 @return size of text in single line
 */
- (CGSize)size;


/**
 multiple line text size, only support NSLineBreakByWordWrapping or NSLineBreakByCharWrapping line break mode

 size  preferd size that text should fit
 @return size that text fits
 */
- (CGSize (^)(CGSize size))sizeThatFits;

@end
