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
    
//    NSAttributedString *hello = [[NSAttributedString alloc] initWithString:@"hello" attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:22.0], NSForegroundColorAttributeName : kRGB(232.0, 74.0, 1.0) }];
//    NSAttributedString *whitespace = [[NSAttributedString alloc] initWithString:@" "];
//    NSAttributedString *world = [[NSAttributedString alloc] initWithString:@"world" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName : [UIColor blackColor] }];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
//    [attributedString appendAttributedString:hello];
//    [attributedString appendAttributedString:whitespace];
//    [attributedString appendAttributedString:world];
//    self.label.attributedText = attributedString;
    
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).build;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).build;
    self.label.attributedText = RFAttributedString(hello, @" ", world);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getters

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

@end
