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
@property (nonatomic, strong) UILabel *spacingLabel;
@property (nonatomic, strong) UILabel *emojiLabel;
@property (nonatomic, strong) UIView *circle;

@end

@implementation RFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100.0);
        make.centerX.mas_equalTo(self.view);
    }];
    
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).compose;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).compose;
    NSAttributedString *spacing = @"".typeface.spacing(6.0);
    self.label.attributedText = RFAttributedString(hello, spacing, world);
    
    [self.view addSubview:self.emojiLabel];
    [self.emojiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(16.0);
        make.centerX.mas_equalTo(self.view);
    }];
    
    UIFont *font = [UIFont systemFontOfSize:22.0];
    spacing = @"".typeface.spacing(10.0);
    NSAttributedString *emoji = [UIImage imageNamed:@"emoji"].attributedString;
    CGFloat offset = roundf(font.capHeight - emoji.size.height) / 2.0;
    emoji = emoji.typeface.offset(offset).compose;
    NSAttributedString *line = [UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(ONE_PIXEL, 12.0)].attributedString;
    self.emojiLabel.attributedText = RFAttributedString(emoji, spacing.copy, hello, spacing.copy, line, spacing, world);
    
    [self.view addSubview:self.spacingLabel];
    [self.spacingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emojiLabel.mas_bottom).offset(16.0);
        make.centerX.mas_equalTo(self.view);
    }];
    
    self.circle.backgroundColor = [UIColor darkGrayColor];
    NSAttributedString *icon = self.circle.snapshot.attributedString;
    offset = roundf(font.capHeight - icon.size.height) / 2.0;
    icon = icon.typeface.offset(offset).compose;
    spacing = @"".typeface.spacing(6.0);
    self.spacingLabel.attributedText = RFAttributedString(icon, spacing.copy, hello, spacing.copy, world);

    [self.view addSubview:self.multiLineLabel];
    [self.multiLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.spacingLabel.mas_bottom).offset(16.0);
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

- (UILabel *)emojiLabel {
    if (!_emojiLabel) {
        _emojiLabel = [[UILabel alloc] init];
    }
    return _emojiLabel;
}

- (UILabel *)spacingLabel {
    if (!_spacingLabel) {
        _spacingLabel = [[UILabel alloc] init];
    }
    return _spacingLabel;
}

- (UILabel *)multiLineLabel {
    if (!_multiLineLabel) {
        _multiLineLabel = [[UILabel alloc] init];
        _multiLineLabel.numberOfLines = 0;
        _multiLineLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 16.0 * 2;
    }
    return _multiLineLabel;
}

- (UIView *)circle {
    if (!_circle) {
        _circle = [[UIView alloc] init];
        _circle.frame = CGRectMake(0.0, 0.0, 6.0, 6.0);
        _circle.layer.cornerRadius = 3.0;
        _circle.layer.masksToBounds = YES;
    }
    return _circle;
}


@end
