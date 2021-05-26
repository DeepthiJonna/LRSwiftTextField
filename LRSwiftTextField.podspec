

Pod::Spec.new do |spec|

  spec.name         = "LRSwiftTextField"
  spec.version      = "1.0.1"
  spec.summary      = "A CocoaPods library for Custom TextField written in Swift."

spec.description  = <<-DESC
This CocoaPods library helps you customise the TextField in Xib with live rendering.
                   DESC

  spec.homepage     = "http://github.com/DeepthiJonna/LRSwiftTextField"



  spec.license       = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "DeepthiJonna" => "deepthi.jonna@gmail.com" }

  spec.ios.deployment_target = "11.0"
  spec.swift_version = "5"

  spec.source        = { :git => "https://github.com/DeepthiJonna/LRSwiftTextField.git", :tag => "#{spec.version}" }
  spec.source_files  = "LRSwiftTextField/**/*.{h,swift}"

end