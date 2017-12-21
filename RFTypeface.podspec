#
# Be sure to run `pod lib lint RFTypeface.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RFTypeface'
  s.version          = '0.1.2'
  s.summary          = 'make NSAttributedString easy to use'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'use chain syntax to make NSAttributedString easy to use'
  s.homepage         = 'https://github.com/Geph0rce/RFTypeface'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Geph0rce' => 'qianjie@58ganji.com' }
  s.source           = { :git => 'https://github.com/Geph0rce/RFTypeface.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RFTypeface/Classes/**/*'
  s.public_header_files = 'RFTypeface/Classes/*.h'

  # s.resource_bundles = {
  #   'RFTypeface' => ['RFTypeface/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RFFoundation'
end
