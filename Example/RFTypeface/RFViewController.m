//
//  RFViewController.m
//  RFTypeface
//
//  Created by Geph0rce on 12/08/2017.
//  Copyright (c) 2017 Geph0rce. All rights reserved.
//

#import "RFViewController.h"

@interface RFViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *multiLineLabel;
@end

@implementation RFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100.0);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [self.view addSubview:self.multiLineLabel];
    [self.multiLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(16.0);
        make.left.mas_equalTo(16.0);
        make.right.mas_equalTo(-16.0);
    }];
    
//    NSAttributedString *hello = [[NSAttributedString alloc] initWithString:@"hello" attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:22.0], NSForegroundColorAttributeName : kRGB(232.0, 74.0, 1.0) }];
//    NSAttributedString *whitespace = [[NSAttributedString alloc] initWithString:@" "];
//    NSAttributedString *world = [[NSAttributedString alloc] initWithString:@"world" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName : [UIColor blackColor] }];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
//    [attributedString appendAttributedString:hello];
//    [attributedString appendAttributedString:whitespace];
//    [attributedString appendAttributedString:world];
//    self.label.attributedText = attributedString;
    
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).compose;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).compose;
    NSAttributedString *spacing = @" ".typeface.kern(6.0).compose;
    self.label.backgroundColor = [UIColor redColor];
    self.label.attributedText = RFAttributedString(hello, spacing, world);
    //NSAttributedString *attributedString = @"attributed string".typeface.normal(22.0).rgb(232, 74, 1).compose;
    NSAttributedString *multiLineString = @"venti venti  venti  venti  venti  venti  venti  venti  venti  venti  venti  venti  venti  venti  venti  venti".typeface.normal(22.0).lineSpacing(10.0).compose;
    self.multiLineLabel.attributedText = multiLineString;
    
    
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

- (UILabel *)multiLineLabel {
    if (!_multiLineLabel) {
        _multiLineLabel = [[UILabel alloc] init];
        _multiLineLabel.numberOfLines = 3.0;
        _multiLineLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 16.0 * 2;
    }
    return _multiLineLabel;
}

@end
