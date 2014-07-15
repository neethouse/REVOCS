#
# Be sure to run `pod lib lint REVOCS.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "REVOCS"
  s.version          = "0.1.0"
  s.summary          = "The UI design specialized binding library"
  s.description      = <<-DESC
                       REVOCS simplify the implementation of the theme feature for iOS apps.
                       DESC
  s.homepage         = "https://github.com/neethouse/REVOCS"
  s.license          = 'MIT'
  s.author           = { "mtmta" => "d.masamoto@covelline.com" }
  s.source           = { :git => "https://github.com/neethouse/REVOCS.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resources = 'Pod/Assets/*.png'
  s.frameworks = 'UIKit'
end
