folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1'
Pod::Spec.new do |s|
  s.name                    = "MineReact"
  s.version                 = "0.54.1"
  s.summary                 = "非官方的react-native ， 使用Cocoapods接入，方便好用！"
  s.description             = <<-DESC
                                React Native apps are built using the React JS
                                framework, and render directly to native UIKit
                                elements using a fully asynchronous architecture.
                                There is no browser and no HTML. We have picked what
                                we think is the best set of features from these and
                                other technologies to build what we hope to become
                                the best product development framework available,
                                with an emphasis on iteration speed, developer
                                delight, continuity of technology, and absolutely
                                beautiful and fast products with no compromises in
                                quality or capability.
                             DESC
  s.homepage                = "https://github.com/hxdwdfang/MineReact"
  s.license                 = { :type => "MIT"}
  s.author                  = "Facebook"
  s.source                  = { :git => "https://github.com/hxdwdfang/MineReact.git", :tag => s.version}
  s.default_subspec         = "Core"
  s.header_dir              = "React"
  s.requires_arc            = true
  s.platforms               = { :ios => "8.0", :tvos => "9.2" }
  s.pod_target_xcconfig     = { "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }
  s.preserve_paths          =  "LICENSE", "LICENSE-docs"
  s.cocoapods_version       = ">= 1.2.0"

  s.subspec "Core" do |ss|
    ss.dependency             "MineReact/yoga"
    ss.source_files         = "React/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files        = "**/__tests__/*",
                              "IntegrationTests/*",
                              "React/DevSupport/*",
                              "React/Inspector/*",
                              "ReactCommon/yoga/*",
                              "React/Cxx*/*",
    ss.ios.exclude_files    = "React/**/RCTTV*.*"
    ss.tvos.exclude_files   = "React/Modules/RCTClipboard*",
                              "React/Views/RCTDatePicker*",
                              "React/Views/RCTPicker*",
                              "React/Views/RCTRefreshControl*",
                              "React/Views/RCTSlider*",
                              "React/Views/RCTSwitch*",
                              "React/Views/RCTWebView*"
    ss.header_dir           = "React"
    ss.framework            = "JavaScriptCore"
    ss.libraries            = "stdc++"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "CxxBridge" do |ss|
    ss.dependency             "Folly", "2016.09.26.00"
    ss.dependency             "MineReact/Core"
    ss.dependency             "MineReact/cxxreact"
    ss.compiler_flags       = folly_compiler_flags
    #ss.private_header_files = "React/Cxx*/*.h"
    ss.source_files         = "React/Cxx*/*.{h,m,mm}"
  end

  s.subspec "DevSupport" do |ss|
    ss.dependency             "MineReact/Core"
    ss.dependency             "MineReact/RCTWebSocket"
    ss.source_files         = "React/DevSupport/*",
                              "React/Inspector/*"
  end

  s.subspec "tvOS" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "React/**/RCTTV*.{h, m}"
  end

  s.subspec "jschelpers" do |ss|
    ss.dependency             "Folly", "2016.09.26.00"
    ss.dependency             "MineReact/PrivateDatabase"
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "ReactCommon/jschelpers/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/jschelpers/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
    ss.framework            = "JavaScriptCore"
  end

  s.subspec "jsinspector" do |ss|
    ss.source_files         = "ReactCommon/jsinspector/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/jsinspector/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "PrivateDatabase" do |ss|
    ss.source_files         = "ReactCommon/privatedata/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/privatedata/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "cxxreact" do |ss|
    ss.dependency             "MineReact/jschelpers"
    ss.dependency             "MineReact/jsinspector"
    ss.dependency             "boost-for-react-native", "1.63.0"
    ss.dependency             "Folly", "2016.09.26.00"
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "ReactCommon/cxxreact/*.{cpp,h}"
    ss.exclude_files        = "ReactCommon/cxxreact/SampleCxxModule.*"
    ss.private_header_files = "ReactCommon/cxxreact/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "ART" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/ART/**/*.{h,m}"
  end

  s.subspec "RCTActionSheet" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/ActionSheetIOS/*.{h,m}"
  end

  s.subspec "RCTAnimation" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{h,m}"
    ss.header_dir           = "RCTAnimation"
  end

  s.subspec "RCTBlob" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Blob/*.{h,m,mm}"
    ss.preserve_paths       = "Libraries/Blob/*.js"
  end

  s.subspec "RCTCameraRoll" do |ss|
    ss.dependency             "MineReact/Core"
    ss.dependency             'MineReact/RCTImage'
    ss.source_files         = "Libraries/CameraRoll/*.{h,m}"
  end

  s.subspec "RCTGeolocation" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Geolocation/*.{h,m}"
  end

  s.subspec "RCTImage" do |ss|
    ss.dependency             "MineReact/Core"
    ss.dependency             "MineReact/RCTNetwork"
    ss.source_files         = "Libraries/Image/*.{h,m}"
  end

  s.subspec "RCTNetwork" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Network/*.{h,m,mm}"
  end

  s.subspec "RCTPushNotification" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/PushNotificationIOS/*.{h,m}"
  end

  s.subspec "RCTSettings" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Settings/*.{h,m}"
  end

  s.subspec "RCTText" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Text/**/*.{h,m}"
  end

  s.subspec "RCTVibration" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/Vibration/*.{h,m}"
  end

  s.subspec "RCTWebSocket" do |ss|
    ss.dependency             "MineReact/Core"
    ss.dependency             "MineReact/RCTBlob"
    ss.dependency             "MineReact/fishhook"
    ss.source_files         = "Libraries/WebSocket/*.{h,m}"
  end

  s.subspec "fishhook" do |ss|
    ss.header_dir           = "fishhook"
    ss.source_files         = "Libraries/fishhook/*.{h,c}"
  end

  s.subspec "RCTLinkingIOS" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/LinkingIOS/*.{h,m}"
  end

  s.subspec "RCTTest" do |ss|
    ss.dependency             "MineReact/Core"
    ss.source_files         = "Libraries/RCTTest/**/*.{h,m}"
    ss.frameworks           = "XCTest"
  end

  s.subspec "_ignore_me_subspec_for_linting_" do |ss|
    ss.dependency             "MineReact/Core"
    ss.dependency             "MineReact/CxxBridge"
  end

  s.subspec "yoga" do |spec|
    spec.header_dir           = "yoga"
    spec.requires_arc = false
    spec.compiler_flags = [
        '-fno-omit-frame-pointer',
        '-fexceptions',
        '-Wall',
        '-Werror',
        '-std=c++1y',
        '-fPIC'
    ]
    spec.source_files = 'ReactCommon/yoga/yoga/**/*.{cpp,h}'
  end

end
