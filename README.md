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
NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).compose;
NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).compose;
self.label.attributedText = RFAttributedString(hello, @" ", world);
```

![](./Screenshots/IMG_2710(20171209-102605).jpg)

## Requirements

iOS 6.0+

## Installation

RFTypeface is available through [https://github.com/Geph0rce/specs.git](https://github.com/Geph0rce/specs.git). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/Geph0rce/specs.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'RFTypeface'
```

## Author

Roger

## License

RFTypeface is available under the MIT license. See the LICENSE file for more info.
