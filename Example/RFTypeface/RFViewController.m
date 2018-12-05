//
//  RFViewController.m
//  RFTypeface
//
//  Created by Geph0rce on 12/08/2017.
//  Copyright (c) 2017 Geph0rce. All rights reserved.
//

#import "RFViewController.h"
#import "RFLabel.h"

static NSString *const kRFViewControllerString = @"Old man look at my life,I'm a lot like you were.Old man look at my life,I'm a lot like you were.Old man look at my life,Twenty four and there's so much moreLive alone in a paradiseThat makes me think of two.Love lost, such a cost,Give me things that don't get lost.Like a coin that won't get tossedRolling home to you.Old man take a look at my life I'm a lot like youI need someone to love me the whole day throughAh, one look in my eyes and you can tell that's true.Lullabies, look in your eyes,Run around the same old town.Doesn't mean that much to meTo mean that much to you.I've been first and lastLook at how the time goes past.But I'm all alone at last.Rolling home to you.";

static NSString *const kDemoText = @"拦路雨偏似雪花 饮泣的你冻吗 Old man look at my life,I'm a lot  这风褛我给你磨到有襟花 连掉了渍也不怕 怎么始终牵挂 苦心选中今天想车你回家 原谅我不再送花  123456 伤口应要结疤 花瓣铺满心里坟场才害怕 如若你非我不嫁 彼此终必火化 一生一世等一天需要代价 谁都只得那双手 靠拥抱亦难任你拥有 要拥有必先懂失去怎接受 曾沿着jmjhkkjhghkj雪路浪游 为何为好事泪流 谁能凭爱意要富士山私有 何不把悲哀感觉 假设是来自你虚构 试管里找不到它染污眼眸 前尘硬化像石头 随缘地抛565765下便逃走   我绝不罕有 往街里绕过一周 我便化乌有   情人节不要说穿 只敢抚你发端 这种姿态可会令你更心酸 留在汽车里取暖 应该怎么规劝 怎么可以将手腕忍痛划损 人活到几岁算短 失恋只有更短 归家需要几里路谁能预算 忘掉我跟你恩怨 樱花开了几转 东京之旅一早比一世遥远 谁都只得那双手";

@interface RFViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *multiLineLabel;
@property (nonatomic, strong) UILabel *spacingLabel;
@property (nonatomic, strong) UILabel *emojiLabel;
@property (nonatomic, strong) UIView *circle;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) RFLabel *moreLabel;
@property (nonatomic, strong) UIButton *moreButton;

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

//    [self.view addSubview:self.multiLineLabel];
//    [self.multiLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.spacingLabel.mas_bottom).offset(16.0);
//        make.left.mas_equalTo(16.0);
//        make.right.mas_equalTo(-16.0);
//    }];
    [self.view addSubview:self.moreLabel];
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.spacingLabel.mas_bottom).offset(16.0);
        make.left.mas_equalTo(16.0);
        make.right.mas_equalTo(-16.0);
        make.height.mas_equalTo(600);
    }];
    
    NSAttributedString *multiLineAttributedString = kRFViewControllerString.typeface.normal(16.0).lineHeight(20.0).compose;
    CGSize size = multiLineAttributedString.typeface.sizeThatFits(CGSizeMake(SCREEN_WIDTH - 32.0, MAXFLOAT));
    DLog(@"size: %@, number of lines: %@", NSStringFromCGSize(size), @(size.height/20.0));
    self.moreLabel.attributedText = kDemoText.typeface.font([UIFont systemFontOfSize:16.0]).color([UIColor blackColor]).compose;
}

- (void)moreAction:(id)sender {
    self.moreButton.selected = !self.moreButton.selected;
    self.moreLabel.numberOfLines = self.moreButton.selected ? 0 : 4;
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

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.numberOfLines = 2;
        NSAttributedString *emoji = [UIImage imageNamed:@"emoji"].attributedString;
        NSAttributedString *text = @"\nemoji".typeface.font([UIFont boldSystemFontOfSize:16.0]).color([UIColor blackColor]).compose;
        text = RFAttributedString(emoji, text).typeface.alignment(NSTextAlignmentCenter).lineHeight(22.0).compose;
        [_button setAttributedTitle:text forState:UIControlStateNormal];
    }
    return _button;
}

- (RFLabel *)moreLabel {
    if (!_moreLabel) {
        _moreLabel = [[RFLabel alloc] init];
        _moreLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 16.0 * 2;
        _moreLabel.numberOfLines = 4;
        _moreLabel.lineSpacing = 6.0;
        _moreLabel.customView = self.moreButton;
    }
    return _moreLabel;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [_moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
        [_moreButton setTitle:@"收起" forState:UIControlStateSelected];
        [_moreButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

@end
