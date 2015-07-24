Pod::Spec.new do |s|
  s.name         = "UITextField+Shake"
  s.version      = "1.1"
  s.summary      = "UITextField category that adds a shake animation like the password field of the OsX login screen."
  s.homepage     = "https://github.com/andreamazz/UITextField-Shake"
  s.social_media_url = 'https://twitter.com/theandreamazz'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Andrea Mazzini" => "andrea.mazzini@gmail.com" }
  s.source       = { :git => "https://github.com/andreamazz/UITextField-Shake.git", :tag => s.version }
  s.platform     = :ios, '6.0'
  s.source_files = 'Source', '*.{h,m}'
  s.requires_arc = true
end
