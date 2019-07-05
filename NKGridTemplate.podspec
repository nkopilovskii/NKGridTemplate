#
# Be sure to run `pod lib lint NKGridTemplate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKGridTemplate'
  s.version          = '0.1.0'
  s.summary          = 'Tool for quick and compact UICollectionView configuration.'

  s.description      = <<-DESC
  The solution is a template with the implementation of the basic methods of configuration and collection view management; uses the configuration mechanism of individual views NKAnyViewModel.
  
  The solution is designed for multi-level architectures, as it allows to distribute the code into the corresponding layers of the module.
                       DESC

  s.homepage         = 'https://github.com/nkopilovskii/NKGridTemplate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nkopilovskii' => 'nkopilovskii@gmail.com' }
  s.source           = { :git => 'https://github.com/nkopilovskii/NKGridTemplate.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mkopilovskii'

  s.ios.deployment_target = '10.0'

  s.source_files = 'NKGridTemplate/Classes/**/*'

  s.dependency 'NKAnyViewModel', '~> 0.1.0.1'
end
