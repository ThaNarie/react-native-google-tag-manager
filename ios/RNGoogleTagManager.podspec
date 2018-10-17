Pod::Spec.new do |s|
  s.name         = "RNGoogleTagManager"
  s.version      = "1.0.0"
  s.summary      = "RNGoogleTagManager"
  s.description  = <<-DESC
                  RNGoogleTagManager
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNGoogleTagManager.git", :tag => "master" }
  s.source_files  = "RNGoogleTagManager/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "Firebase/Core"
  s.dependency "GoogleTagManager", "~> 6.0"
end

  