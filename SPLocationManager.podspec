Pod::Spec.new do |s|
  s.name         = "SPLocationManager"
  s.version      = "1.0.0"
  s.summary      = "iOS CLLocationManager wrapper with cache of last location and default implementation of CLLocationManagerDelegate methods."

  s.description  = <<-DESC
                   iOS CLLocationManager wrapper with cache of last location and default implementation of CLLocationManagerDelegate methods.
                   DESC

  s.homepage     = "https://github.com/Sigmapoint/SPLocationManager"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Kamil Burczyk" => "kamil.burczyk@sigmapoint.pl" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/Sigmapoint/SPLocationManager.git", :tag => "1.0.0" }
  s.source_files  = 'SPLocationManager', 'SPLocationManager/**/*.{h,m}'
  s.public_header_files = 'SPLocationManager/**/*.h'
  s.framework  = 'Foundation'
  s.requires_arc = true
end
