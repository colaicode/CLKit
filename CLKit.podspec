#
#  Be sure to run `pod spec lint CLKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CLKit"
  s.version      = "1.1.6"
  s.summary      = "一些常用控件封装"
  s.description  = <<-DESC
  封装了常用的控件，如button、label、textfield、alertView、actionSheet等,提供链式语法
                   DESC

  s.homepage     = "https://github.com/colaicode/CLKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "colaicode" => "colaicode@163.com" } 
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/colaicode/CLKit.git", :tag => "#{s.version}" }

  s.resource     = 'CLKitDemo/KKKit/KKKit.bundle'
  s.requires_arc = true
  s.dependency "Masonry"
  s.subspec 'KKBaseButton' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseButton/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseButton/KKBaseButton.h'
  end

  s.subspec 'KKBaseLabel' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseLabel/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseLabel/KKBaseLabel.h'
  end
  s.subspec 'KKBaseAlertView' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseAlertView/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseAlertView/KKBaseAlertView.h'
  end
  s.subspec 'KKBaseActionSheet' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseActionSheet/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseActionSheet/KKBaseActionSheet.h'
  end
  s.subspec 'KKBaseTextField' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseTextField/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseTextField/KKBaseTextField.h'
  end
  s.subspec 'KKBaseTableView' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseTableView/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseTableView/*.h'
  end
  s.subspec 'KKBaseViewController' do |ss|
    ss.source_files = 'CLKitDemo/KKKit/KKBaseViewController/*.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKKit/KKBaseViewController/*.h'
    ss.dependency "CLKit/KKBaseLabel"
    ss.dependency "CLKit/KKBaseButton"
    ss.dependency "CLKit/KKBaseTableView"
  end

end
