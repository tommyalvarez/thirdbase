$:.push File.expand_path('../lib', __FILE__)
require 'third_base/version'

Gem::Specification.new do |s|
  s.name          = 'thirdbase'
  s.version       = ThirdBase::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Karle Durante', 'Hunter Madison', 'Ken Collins']
  s.email         = ['kdurante@customink.com', 'hunterglenmadison@icloud.com', 'ken@metaskills.net']
  s.homepage      = 'http://github.com/tommyalvarez/thirdbase'
  s.summary       = 'Seamless third database integration for Rails.'
  s.description   = "ThirdBase provides support for Rails to manage dual databases by extending ActiveRecord tasks that create, migrate, and test your databases."
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.rdoc_options  = ['--charset=UTF-8']
  s.license       = 'MIT'
  s.add_runtime_dependency     'rails', '>= 4.0'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'yard'
end
