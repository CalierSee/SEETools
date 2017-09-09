#
# Be sure to run `pod lib lint SEETools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SEETools'
  s.version          = '0.1.0'
  s.summary          = 'Tools'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
* Kit 视图框架

    **View  视图
        SEETagView


    **ViewController  控制器
        SEETagViewController

* Tools
    **Chain

    **SEETools

                       DESC

  s.homepage         = 'https://github.com/436005247@qq.com/SEETools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '436005247@qq.com' => '436005247@qq.com' }
  s.source           = { :git => 'https://github.com/436005247@qq.com/SEETools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SEETools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SEETools' => ['SEETools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'

  s.subspec 'Kit' do |kit|
    s.dependency 'Masonry'


  end

  s.subspec 'Tools' do |tools|


  end

end
