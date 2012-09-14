# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Nathan Lilienthal"]
  gem.email         = ["nathanlil13@me.com"]
  gem.description   = %q{A better way to interact with Java.}
  gem.summary       = %q{An assistant to ease the pains of working with Java.}
  gem.homepage      = "http://github.com/Epicgrim/jarvis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jarvis"
  gem.version       = "0.0.3"

  gem.add_runtime_dependency "thor"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rocco"
  gem.add_development_dependency "cane"
end