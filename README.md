# RFTypeface

make NSAttributedString easy to use



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objectivec
	// before:
    NSAttributedString *hello = [[NSAttributedString alloc] initWithString:@"hello" attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:22.0], NSForegroundColorAttributeName : kRGB(232.0, 74.0, 1.0) }];
    NSAttributedString *whitespace = [[NSAttributedString alloc] initWithString:@" "];
    NSAttributedString *world = [[NSAttributedString alloc] initWithString:@"world" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName : [UIColor blackColor] }];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    [attributedString appendAttributedString:hello];
    [attributedString appendAttributedString:whitespace];
    [attributedString appendAttributedString:world];
    self.label.attributedText = attributedString;
    
    // after:
    NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).build;
    NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).build;
    self.label.attributedText = RFAttributedString(hello, @" ", world);```

## Requirements

## Installation

RFTypeface is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RFTypeface'
```

## Author

Roger

## License

RFTypeface is available under the MIT license. See the LICENSE file for more info.
