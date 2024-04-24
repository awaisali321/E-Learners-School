# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'E learners' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for E learners

  target 'E learnersTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'E learnersUITests' do
    # Pods for testing
  end
  pod 'SwiftLog'
  pod 'SwiftHSVColorPicker'
  pod 'Kingfisher/SwiftUI'
  pod 'Intercom', '10.4.0'
  pod 'DropDown', '2.3.13'
  pod 'SDWebImage', '5.0'
#    pod 'CircleColorPicker', '~> 1.0.0'
  pod 'IQKeyboardManagerSwift', '6.5.0'
  pod 'Moya', '~> 13.0'
  pod 'JGProgressHUD'
  pod 'R.swift', '6.1.0'
  # For gif images
  pod 'SwiftyGif'
  # For drop down menu
#    pod 'DropDown'
  pod 'GoogleMaps', '5.2.0'
  pod 'TagListView', '~> 1.0'
  pod 'Presentr'
  pod 'GooglePlaces', '7.1.0'
  pod 'Cosmos'
#    pod 'SignalRSwift', '~> 2.0.2'
  pod 'SwiftyJSON'
  pod 'SwiftSignalRClient', '0.9.0'
  pod 'Charts', '4.1.0'
pod 'AZTabBar'
pod 'RappleProgressHUD'
pod 'SideMenuController'
pod 'FSCalendar', '~> 2.8.4'
pod 'Toast-Swift'


end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "12.0"
     end
  end
end
