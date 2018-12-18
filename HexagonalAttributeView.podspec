Pod::Spec.new do |s|
  s.name             = 'HexagonalAttributeView'
  s.version          = '1.0.0'
  s.summary          = 'HexagonalAttributeView'
  s.homepage         = 'https://github.com/iosLiuPeng/HexagonalAttributeView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iosLiuPeng' => '392009255@qq.com' }
  s.source           = { :git => 'https://github.com/iosLiuPeng/HexagonalAttributeView.git', :tag => s.version.to_s }
  s.platform     = :ios 
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks = 'UIKit'
  # s.resource_bundles = {
  #   'view' => ['Assets/*.png']
  # }
end
