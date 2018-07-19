//
//  RFViewController.m
//  RFTypeface
//
//  Created by Geph0rce on 12/08/2017.
//  Copyright (c) 2017 Geph0rce. All rights reserved.
//

#import "RFViewController.h"

static NSString *const kRFViewControllerString = @"Old man look at my life,I'm a lot like you were.Old man look at my life,I'm a lot like you were.Old man look at my life,Twenty four and there's so much moreLive alone in a paradiseThat makes me think of two.Love lost, such a cost,Give me things that don't get lost.Like a coin that won't get tossedRolling home to you.Old man take a look at my life I'm a lot like youI need someone to love me the whole day throughAh, one look in my eyes and you can tell that's true.Lullabies, look in your eyes,Run around the same old town.Doesn't mean that much to meTo mean that much to you.I've been first and lastLook at how the time goes past.But I'm all alone at last.Rolling home to you.";

@interface RFViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *multiLineLabel;
@end

@implementation RFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100.0);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(16.0);
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
    
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).background([UIColor greenColor]).compose;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).compose;
    NSAttributedString *spacing = @" ".typeface.font([UIFont systemFontOfSize:1.0]).kern(6.0).compose;
    self.label.attributedText = RFAttributedString(hello, spacing, world);
    
    NSAttributedString *oldMan = kRFViewControllerString.typeface.font([UIFont systemFontOfSize:16.0]).lineHeight(20.0).firstLineHeadIndent(60.0).lineBreakMode(NSLineBreakByTruncatingTail).compose;
    
    self.multiLineLabel.attributedText = oldMan;
    
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
