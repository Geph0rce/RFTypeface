//
//  RFViewController.m
//  RFTypeface
//
//  Created by Geph0rce on 12/08/2017.
//  Copyright (c) 2017 Geph0rce. All rights reserved.
//

#import "RFViewController.h"

#define  ONE_PIXEL (1.0/[UIScreen mainScreen].scale)
static NSString *const kRFViewControllerString = @"Old man look at my life,I'm a lot like you were.Old man look at my life,I'm a lot like you were.Old man look at my life,Twenty four and there's so much moreLive alone in a paradiseThat makes me think of two.Love lost, such a cost,Give me things that don't get lost.Like a coin that won't get tossedRolling home to you.Old man take a look at my life I'm a lot like youI need someone to love me the whole day throughAh, one look in my eyes and you can tell that's true.Lullabies, look in your eyes,Run around the same old town.Doesn't mean that much to meTo mean that much to you.I've been first and lastLook at how the time goes past.But I'm all alone at last.Rolling home to you.";

@interface RFViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *multiLineLabel;
@property (nonatomic, strong) UILabel *spacingLabel;
@property (nonatomic, strong) UILabel *seperatorLabel;

@end

@implementation RFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSAttributedString *hello = [[NSAttributedString alloc] initWithString:@"hello" attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:22.0], NSForegroundColorAttributeName : kRGB(232.0, 74.0, 1.0) }];
    //    NSAttributedString *whitespace = [[NSAttributedString alloc] initWithString:@" "];
    //    NSAttributedString *world = [[NSAttributedString alloc] initWithString:@"world" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName : [UIColor blackColor] }];
    //    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    //    [attributedString appendAttributedString:hello];
    //    [attributedString appendAttributedString:whitespace];
    //    [attributedString appendAttributedString:world];
    //    self.label.attributedText = attributedString;
    
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100.0);
        make.centerX.mas_equalTo(self.view);
    }];
    
    
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).compose;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).compose;
    NSAttributedString *spacing = @"".typeface.spacing(6.0);
    self.label.attributedText = RFAttributedString(hello, spacing, world);
    
    
    spacing = @"".typeface.spacing(20.0);
    self.spacingLabel.attributedText = RFAttributedString(spacing.copy, hello, world);
    
    [self.view addSubview:self.seperatorLabel];
    [self.seperatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(16.0);
        make.centerX.mas_equalTo(self.view);
    }];
   
    spacing = @"".typeface.spacing(10.0);
    NSAttributedString *emoji = [UIImage imageNamed:@"emoji"].attributedString.typeface.offset(-2.0).compose;
    NSAttributedString *line = [UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(ONE_PIXEL, 12.0)].attributedString;
    self.seperatorLabel.attributedText = RFAttributedString(emoji, spacing.copy, hello, spacing.copy, line, spacing, world);
    
    [self.view addSubview:self.multiLineLabel];
    [self.multiLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.seperatorLabel.mas_bottom).offset(16.0);
        make.left.mas_equalTo(16.0);
        make.right.mas_equalTo(-16.0);
    }];
    
    NSAttributedString *multiLineAttributedString = kRFViewControllerString.typeface.normal(16.0).lineHeight(20.0).compose;
    CGSize size = multiLineAttributedString.typeface.sizeThatFits(CGSizeMake(SCREEN_WIDTH - 32.0, MAXFLOAT));
    DLog(@"size: %@, number of lines: %@", NSStringFromCGSize(size), @(size.height/20.0));
    self.multiLineLabel.attributedText = multiLineAttributedString;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getters

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14.0];
    }
    return _label;
}


- (UILabel *)seperatorLabel {
    if (!_seperatorLabel) {
        _seperatorLabel = [[UILabel alloc] init];
    }
    return _seperatorLabel;
}

- (UILabel *)multiLineLabel {
    if (!_multiLineLabel) {
        _multiLineLabel = [[UILabel alloc] init];
        _multiLineLabel.numberOfLines = 0;
        _multiLineLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 16.0 * 2;
    }
    return _multiLineLabel;
}




@end
