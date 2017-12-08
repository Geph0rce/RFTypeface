//
//  RFTypeface.h
//  Pods-RFTypeface_Example
//
//  Created by qianjie on 2017/12/8.
//

#import <RFTypeface/NSString+RFTypeface.h>
#import <RFFoundation/RFFoundation.h>

#define RFAttributedString(...) _RFAttributedString(metamacro_argcount(__VA_ARGS__), __VA_ARGS__)

NSAttributedString *_RFAttributedString(int size,...);

@interface RFTypeface : NSObject

@property (nonatomic, copy) NSString *string;

- (RFTypeface *(^)(CGFloat fontSize))normal;
- (RFTypeface *(^)(CGFloat fontSize))bold;
- (RFTypeface *(^)(UIFont *font))font;


- (RFTypeface *(^)(UIColor *color))color;
- (RFTypeface *(^)(CGFloat red, CGFloat green, CGFloat blue))rgb;
- (RFTypeface *(^)(NSUInteger hexValue))hex;

- (NSAttributedString *)build;

@end
