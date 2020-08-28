#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_math_view.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_math_view'
  s.version          = '0.0.1'
  s.summary          = 'LaTeX inside Flutter'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/pstwh/flutter_math_view'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'pstwh' => 'contato@pauloalvesjr.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'iosMath'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
