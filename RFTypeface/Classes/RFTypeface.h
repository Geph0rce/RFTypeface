//
//  RFTypeface.h
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import <RFTypeface/NSString+RFTypeface.h>

#define RFAttributedString(...) _RFAttributedString(metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

NSAttributedString *_RFAttributedString(int size,...);

@interface RFTypeface : NSObject

@property (nonatomic, copy) NSString *string;


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

- (NSAttributedString *)compose;

@end
