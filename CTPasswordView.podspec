
Pod::Spec.new do |s|
  s.name             = 'CTPasswordView'
  s.version          = '1.0.3'
  s.summary          = 'CTPasswordView.'
  s.homepage         = 'https://github.com/qingtianct/CTPassWordView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qingtianct' => '1295890900@qq.com' }
  s.source           = { :git => 'https://github.com/qingtianct/CTPassWordView', :tag => '1.0.3' }

  s.ios.deployment_target = '9.0'
  s.source_files = 'CTPasswordView/*','CTPasswordView/Classes/*.{h,m}','CTPasswordView/Classes/**/*.{h,m}'
  s.resource = 'CTPasswordView/Assets/CTPassword.bundle'
 # s.public_header_files = 'Pod/Classes/*.h','Pod/Classes/**/*.h'
end
