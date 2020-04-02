
platform :ios, '8.0'
use_frameworks!
workspace 'NPDemoProject.xcworkspace'
 
abstract_target 'NPDemoProject' do
	# swift
	pod 'RxSwift'
	pod 'RxCocoa'
	pod 'Kingfisher'
	pod 'SnapKit'
	pod 'IQKeyboardManagerSwift'
	pod 'ObjectMapper'

	#oc
	pod 'CYLTabBarController'
	pod 'LYEmptyView'

    target 'NPDemoProject' do
      	project 'NPDemoProject/NPDemoProject.xcodeproj'
    end

    target 'NPHome' do
      	project 'NPHome/NPHome.xcodeproj'
    end

    target 'NPBaseKit' do
      project 'NPBaseKit/NPBaseKit.xcodeproj'
    end
end


