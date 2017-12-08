# RFTypeface

make NSAttributedString easy to use



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

{% highlight objc %}
NSAttributedString *hello = @"hello".typeface.bold(22.0).rgb(232, 74, 1).build;
NSAttributedString *world = @"world".typeface.normal(22.0).rgb(0, 0, 0).build;
self.label.attributedText = RFAttributedString(hello, @" ", world);
{% endhighlight %}

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
