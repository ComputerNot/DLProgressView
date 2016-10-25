Pod::Spec.new do |s|
s.name = 'DLProgressView'
s.version = '1.0.3'
s.license = 'MIT'
s.summary = 'DLProgressView in iOS.'
s.homepage = 'https://github.com/ComputerNot/DLProgressView'
s.authors = { 'johnLiu' => 'computernot@qq.com' }
s.source = { :git => "https://github.com/ComputerNot/DLProgressView.git", :tag => s.version.to_s}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "Classes", "DLProgressView/*"
end
