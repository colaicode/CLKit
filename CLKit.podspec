#
#  Be sure to run `pod spec lint CLKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CLKit"
  s.version      = "1.0.1"
  s.summary      = "一些常用控件封装"
  s.description  = <<-DESC
  封装了常用的控件，如button、label、alertView、actionSheet等
                   DESC

  s.homepage     = "https://github.com/colaicode/CLKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "colaicode" => "colaicode@163.com" } 
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/colaicode/CLKit.git", :tag => "#{s.version}" }

  s.source_files  = "CLKitDemo/KKKit/KKKit.h"
  s.public_header_files = "CLKitDemo/KKKit/KKKit.h" 
  s.requires_arc = true

  s.subspec 'KKBaseButton' do |ss|
    ss.source_files = 'CLKitDemo/KKBaseButton.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKBaseButton.h'
  end

  s.subspec 'KKBaseLabel' do |ss|
    ss.source_files = 'CLKitDemo/KKBaseLabel.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKBaseLabel.h'
  end
  s.subspec 'KKBaseAlertView' do |ss|
    ss.source_files = 'CLKitDemo/KKBaseAlertView.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKBaseAlertView.h'
  end
  s.subspec 'KKBaseActionSheet' do |ss|
    ss.source_files = 'CLKitDemo/KKBaseActionSheet.{h,m}'
    ss.public_header_files = 'CLKitDemo/KKBaseActionSheet.h'
  end


end
