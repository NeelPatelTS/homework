platform :ios, '12.0'
use_frameworks!

inhibit_all_warnings!

target 'JetDevsHomeWork' do
  pod 'RxSwift', '~> 5.1.0'
  pod 'RxCocoa'
  pod 'SwiftLint'
  pod 'Kingfisher'
  pod 'SnapKit'

  target 'JetDevsHomeWorkTests' do
    inherit! :search_paths
  end
  
  target 'JetDevsHomeWorkUITests' do
    inherit! :complete
  end
  
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
          File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
      end
    end
  end
  
end

