Pod::Spec.new do |s|
  s.name             = 'OTPTextField'
  s.version          = '0.1.0'
  s.summary          = 'A short description of OTPTextField.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Berdikhan/OTPTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Berdikhan' => 'berdikhan@gmail.com' }
  s.source           = { :git => 'https://github.com/Berdikhan/OTPTextField.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/berdikhan-satenov-866390111/'

  s.ios.deployment_target = '8.0'

  s.source_files = 'OTPTextField/Classes/**/*'
  
end
