Pod::Spec.new do |s|
  s.name = 'iMindLib'
  s.version = '1.0.0'
  s.license = { type: 'MIT', file: 'LICENSE' }
  s.summary = 'iMind\'s Swift Library'
  s.homepage = 'https://github.com/imindeu/iMindLib.swift'
  s.social_media_url = 'http://twitter.com/imindeu'
  s.authors = { 'iMind developers' => 'hello@imind.eu' }
  s.source = { :git => 'https://github.com/imindeu/iMindLib.swift.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'Source/**/*.swift'
end
