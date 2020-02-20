# Uncomment the next line to define a global platform for your project
platform :ios, '13.2'

target 'MarkDownTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MarkDownTest
  pod "MarkdownKit"
  pod "Alamofire"
  pod 'SwiftyMarkdown'

  target 'MarkDownTestUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.2'
        end
    end
end
