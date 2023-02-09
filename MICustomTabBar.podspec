Pod::Spec.new do |s|
s.name             = 'MICustomTabBar'  
s.version          = '0.0.1'  
s.summary          = 'Custom pod creation for iOS' 
s.description      = 'Describe the use of pod file'
s.swift_version = '5.0'

s.homepage         = 'https://github.com/PiyushSelarka/MICustomTabBarSwiftUI'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'piyushselarka.mi@gmail.com' } 
s.source           = { :git => 'https://github.com/PiyushSelarka/MICustomTabBarSwiftUI.git', :tag => s.version.to_s } 
s.ios.deployment_target = '15.0'
s.source_files = 'MICustomTabBar/CustomTabView.{swift}'
end