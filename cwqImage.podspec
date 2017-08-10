Pod::Spec.new do |s|
  s.name         = "cwqImage"
  s.version      = “1.0.1”
  s.summary      = "A fast integration images loop function of custom control"
  s.description  = "A fast integration images loop function of custom control addtion with cocoapod support."
  s.homepage     = "https://github.com/HdNate/CWQTest"
  s.social_media_url   = "http://www.weibo.com/u/5267312788"
  s.license= { :type => "MIT", :file => "LICENSE" }
  s.author       = { “HdNate” => "578663855@qq.com" }
  s.source       = { :git => "https://github.com/HdNate/CWQTest.git", :tag => s.version }
  s.source_files = "*.{h,m}"
  s.ios.deployment_target = ‘9.0’
  s.frameworks   = 'UIKit'
  s.requires_arc = true

end