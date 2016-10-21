Pod::Spec.new do |s|
s.name = 'DLProgressView'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = 'A Text in iOS.'
s.homepage = 'https://github.com/ComputerNot/DLProgressView'
s.authors = { 'johnLiu' => 'computernot@qq.com' }
s.source = { :git => "https://github.com/ComputerNot/DLProgressView.git", :tag => "1.0.1"}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "Classes", "DLProgressView/*"
end
