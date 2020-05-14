
platform :ios, '8.0'
use_frameworks!
workspace 'NPDemoProject.xcworkspace'
 
abstract_target 'NPDemoProject' do
	# swift
	pod 'RxSwift'
	pod 'RxCocoa'
  pod 'ReachabilitySwift'
	pod 'Kingfisher'
	pod 'SnapKit'
	pod 'IQKeyboardManagerSwift'
  pod 'Moya'
  pod 'HandyJSON'
  pod 'URLNavigator'
  pod 'FWPopupView'
  pod 'SwiftTheme'
  pod 'ActiveLabel'
  
	#oc
	pod 'CYLTabBarController'
	pod 'LYEmptyView'
  
  #debug
  pod 'CocoaDebug', :configurations => ['Debug']
  
    target 'NPDemoProject' do
      	project 'NPDemoProject/NPDemoProject.xcodeproj'
    end

    target 'NPHome' do
      	project 'NPHome/NPHome.xcodeproj'
    end
    
    target 'NPMine' do
        project 'NPMine/NPMine.xcodeproj'
    end
    
    target 'NPBaseKit' do
      project 'NPBaseKit/NPBaseKit.xcodeproj'
    end
    
    target 'NPDemoProjectTests' do
        project 'NPDemoProject/NPDemoProject.xcodeproj'
    end

    target 'NPHomeTests' do
        project 'NPHome/NPHome.xcodeproj'
    end
    
    target 'NPMineTests' do
        project 'NPMine/NPMine.xcodeproj'
    end
     
end

