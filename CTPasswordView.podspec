#
# Be sure to run `pod lib lint CTPasswordView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CTPasswordView'
  s.version          = '1.0.1'
  s.summary          = 'CTPasswordView.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/qingtianct/CTPassWordView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qingtianct' => '1295890900@qq.com' }
  s.source           = { :git => 'https://github.com/qingtianct/CTPassWordView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'CTPasswordView/Classes/*','CTPasswordView/Classes/**/*'
  s.resource = ['Resources/CTPassword.bundle','CTPasswordView/Assets/*.xcassets']
   s.resource_bundles = {
      'CTPasswordBundle' => ['CTPasswordView/Assets/*.xcassets']
   }

  s.public_header_files = 'Pod/Classes/*.h','Pod/Classes/**/*.h'
end
